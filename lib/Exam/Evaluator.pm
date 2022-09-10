package Exam::Evaluator;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exam::Parser;

use Exporter 'import';
our @EXPORT = ('score_exams');

use Data::Dump 'dump';

sub score_exams($master_exam, $student_exams) {
    for my $student_exam (@{$student_exams}) {
        score_exam($master_exam, $student_exam);
    }
}

# method to score an individual exam
sub score_exam($master_exam, $student_exam) {
    my $score = 0;

    for my $master_question (@{$master_exam->{'QUESTIONS'}}) {
        my @checked_answers = @{get_checked_answers($master_question)};
        my $master_question_text = $master_question->{'QUESTION_TEXT'};
        my $correct_answer = $checked_answers[0];

        # search for this exact question in the student exam
        my ($output) = grep { $_->{'QUESTION_TEXT'} eq $master_question_text } @{$student_exam->{'QUESTIONS'}};

        dump ($student_exam->{'QUESTIONS'});

        last;
        # dump ($output);


        # for my $question (@{$student_exam->{'QUESTIONS'}}) {
        #     my $question_text = $question->{'QUESTION_TEXT'};
        #
        #     # we found the question
        #     if (normalize_string($master_question_text) eq normalize_string($question_text)) {
        #         my @student_checked_answers = @{get_checked_answers($question)};
        #
        #         for (@student_checked_answers) {
        #             # if (normalize_string($correct_answer) eq normalize_string($_)) {
        #             $score++;
        #             # } else {
        #             #     dump(@student_checked_answers);
        #             # }
        #         }
        #         last;
        #     }
        # }

    }

    say "$score/30";
}
