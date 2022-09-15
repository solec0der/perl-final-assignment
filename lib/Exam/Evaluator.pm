package Exam::Evaluator;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exam::Parser;
use String::Util;

use Data::Dumper;

use Exporter 'import';
our @EXPORT = ('score_exams', 'print_missing_questions_and_answers');

sub score_exams($master_exam, $student_exams) {
    my @reports;
    for my $student_exam (@{$student_exams}) {
        push(@reports, score_exam($master_exam, $student_exam));
    }
    return \@reports;
}

# method to score an individual exam
sub score_exam($master_exam, $student_exam) {
    my %report;
    $report{'source_file_name'} = $student_exam->{'source_file_name'};
    $report{'missing_questions'} = [];
    $report{'missing_answers'} = [];
    $report{'correctly_answered_questions'} = 0;
    $report{'answered_questions'} = 0;

    for my $master_question (@{$master_exam->{'questions'}}) {
        my $master_question_text = $master_question->{'question'}->{'text'};

        my @checked_answers = @{get_checked_answers($master_question)};
        my $correct_answer = $checked_answers[0];

        my $found_question = 0;

        for my $student_question (@{$student_exam->{'questions'}}) {
            my $student_question_text = $student_question->{'question'}->{'text'};

            my $matched_question_text = fuzzy_match_string($master_question_text, $student_question_text);

            if ($matched_question_text) {
                if (!($matched_question_text eq normalize_string($master_question_text))) {
                    my %ineaxct_match = (
                        "expected_text" => normalize_string($master_question_text),
                        "actual_text"   => $matched_question_text
                    );

                    push(@{$report{'inexactly_matched_questions'}}, \%ineaxct_match);
                }

                $found_question = 1;
                my @student_checked_answers = @{get_checked_answers($student_question)};
                my %missing_answers_report = %{get_missing_answers($master_question->{'answers'}, $student_question->{'answers'})};

                push @{$report{'missing_answers'}}, @{$missing_answers_report{'missing_answers'}};
                push @{$report{'inexactly_matched_answers'}}, @{$missing_answers_report{'inexact_matches'}};

                if (scalar(@student_checked_answers) == 1) {
                    $report{'answered_questions'}++;
                    my $student_answer = $student_checked_answers[0]->{'text'};

                    my $matched_answer_text = fuzzy_match_string($student_answer, $correct_answer->{'text'});

                    if ($matched_answer_text) {
                        $report{'correctly_answered_questions'}++;
                    }
                }
                last;
            }
        }

        if (!$found_question) {
            push(@{$report{'missing_questions'}}, $master_question_text);
        }
    }

    # Print the score in loop so the user gets instant feedback
    print_score(\%report);
    return \%report;
}

sub get_missing_answers($actual_answers, $student_answers) {
    my @missing_answers = ();
    my @inexact_matches = ();

    for my $actual_answer (@{$actual_answers}) {
        my $found = 0;

        for my $student_answer (@{$student_answers}) {
            my $matched_answer_text = fuzzy_match_string($actual_answer->{'text'}, $student_answer->{'text'});

            if ($matched_answer_text) {
                $found = 1;

                if (!($matched_answer_text eq normalize_string($actual_answer->{'text'}))) {
                    my %ineaxct_match = (
                        "expected_text" => normalize_string($actual_answer->{'text'}),
                        "actual_text"   => $matched_answer_text
                    );
                    push(@inexact_matches, \%ineaxct_match);
                }
                last;
            }
        }
        if ($found == 0) {
            push(@missing_answers, $actual_answer->{'text'});
        }
    }
    my %missing_answers_report = (
        "missing_answers" => \@missing_answers,
        "inexact_matches" => \@inexact_matches
    );

    return \%missing_answers_report;
}

sub print_score($report) {
    say "$report->{'source_file_name'} scored $report->{'correctly_answered_questions'}/$report->{'answered_questions'} points";
}

sub print_missing_questions_and_answers($reports) {
    say "\n\nThe following issues were found while evaluating the exams. These exams might need further manual investigation:\n\n";

    for my $report (@{$reports}) {
        if (scalar(@{$report->{'missing_questions'}}) == 0 && scalar(@{$report->{'missing_answers'}}) == 0) {
            next;
        }

        say "$report->{'source_file_name'}:";

        for my $missing_question (@{$report->{'missing_questions'}}) {
            print "    Missing question: $missing_question";
        }

        for my $missing_answer (@{$report->{'missing_answers'}}) {
            print "    Missing answer: $missing_answer";
        }

        for my $inexactly_matched_question (@{$report->{'inexactly_matched_questions'}}) {
            print "    Missing question: " . $inexactly_matched_question->{'expected_text'};
            print "    Used this instead: " . $inexactly_matched_question->{'actual_text'};
        }

        for my $inexactly_matched_answer (@{$report->{'inexactly_matched_answers'}}) {
            say "    Missing answer: " . $inexactly_matched_answer->{'expected_text'};
            say "    Used this instead: " . $inexactly_matched_answer->{'actual_text'};
            say "";
        }
    }
}