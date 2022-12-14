package Exam::Evaluator;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exam::Parser;
use String::Util;
use Terminal::Util;

use Data::Dumper;

use Exporter 'import';
our @EXPORT = ('score_exams', 'print_missing_questions_and_answers');

# Wrapper function for score_exam where a list of student_exams can be passed
sub score_exams($master_exam, $student_exams) {
    say "\n\n";
    print_separator();
    say "=== Results ===";
    print_separator();

    say "\n\n";

    my @reports;
    for my $student_exam (@{$student_exams}) {
        push(@reports, score_exam($master_exam, $student_exam));
    }
    return \@reports;
}

# method to score an individual exam
sub score_exam($master_exam, $student_exam) {
    # Setup report hash data structure
    my %report;
    $report{'source_file_name'} = $student_exam->{'source_file_name'};
    $report{'missing_questions'} = [];
    $report{'missing_answers'} = [];
    $report{'inexactly_matched_questions'} = [];
    $report{'inexactly_matched_answers'} = [];
    $report{'correctly_answered_questions'} = 0;
    $report{'answered_questions'} = 0;

    # Iterate over questionos in master exam and searching student exam for each question
    for my $master_question (@{$master_exam->{'questions'}}) {
        my $master_question_text = $master_question->{'question'}->{'text'};

        my @checked_answers = @{get_checked_answers($master_question)};
        my $correct_answer = $checked_answers[0];

        my $found_question = 0;

        for my $student_question (@{$student_exam->{'questions'}}) {
            my $student_question_text = $student_question->{'question'}->{'text'};

            my $matched_question_text = fuzzy_match_string($master_question_text, $student_question_text);

            if ($matched_question_text) {
                # If the found question is not an exact match, add it to the list of inexact question matches.
                if (!($matched_question_text eq normalize_string($master_question_text))) {
                    my %ineaxct_match = (
                        "expected_text" => normalize_string($master_question_text),
                        "actual_text"   => $matched_question_text
                    );

                    push(@{$report{'inexactly_matched_questions'}}, \%ineaxct_match);
                }

                # If the question was found, search all answers in the student exam and check if the correct answer is
                # checked and if answers are missing from the exam
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
            # won't use fuzzy matching here yet due to a bug in the fuzzy matcher
            if (normalize_string($actual_answer->{'text'}) eq normalize_string($student_answer->{'text'})) {
                $found = 1;
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
    for my $report (@{$reports}) {
        if (scalar(@{$report->{'inexactly_matched_questions'}}) == 0 &&
            scalar(@{$report->{'inexactly_matched_answers'}}) == 0 &&
            scalar(@{$report->{'missing_questions'}}) == 0 &&
            scalar(@{$report->{'missing_answers'}}) == 0
        ) {
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
            say "    Missing question: " . $inexactly_matched_question->{'expected_text'};
            say "    Used this instead: " . $inexactly_matched_question->{'actual_text'};
            say "";
        }

        for my $inexactly_matched_answer (@{$report->{'inexactly_matched_answers'}}) {
            say "    Missing answer: " . $inexactly_matched_answer->{'expected_text'};
            say "    Used this instead: " . $inexactly_matched_answer->{'actual_text'};
            say "";
        }
    }
}

1; # Magic true value required at end of module

=head1 NAME

Exam::Evaluator - Module providing functions to evaluate an exam and find missing questions and answers.

=head1 VERSION

This documentation refers to Exam::Evaluator version 0.0.1

=head1 SYNOPSIS

    # Scores a list of exams
    # The exams need to be read from a file with the Exam::Parser module.

    # Load the master file containing the correct answers
    my $master_file_content = load_file($master_file_name);
    my $master_exam = parse_exam($master_file_name, $master_file_content);

    my @student_exams;

    # Load all student exam files
    for my $student_exam_file_name (@student_exam_file_names) {
      my $file_content = load_file($student_exam_file_name) || '';
      push(@student_exams, parse_exam($student_exam_file_name, $file_content));
    }

    # Score exams using the master exam and produce a list of reports
    # These reports contain information about
    # - how many questions are missing from the student file
    # - how many answers are missing from the answer file
    # - how many questions were inexactly matched (the student file contains a question that is similar to the master file)
    # - how many answers were inexactly matched (the student file contains an answer that is similar to the master file)
    # - how many answers were correctly answered
    # - how many answers were answered in total
    my $reports = score_exams($master_exam, \@student_exams);

    # Takes a report as an input and prints the missing questions and answers
    print_missing_questions_and_answers(\$reports);
