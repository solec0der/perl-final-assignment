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

    for my $master_question (@{$master_exam->{'questions'}}) {
        my $master_question_text = $master_question->{'question'}->{'text'};

        my @checked_answers = @{get_checked_answers($master_question)};
        my $correct_answer = $checked_answers[0];

        for my $student_question (@{$student_exam->{'questions'}}) {
            my $student_question_text = $student_question->{'question'}->{'text'};

            if (normalize_string($master_question_text) eq normalize_string($student_question_text)) {
                my @student_checked_answers = @{get_checked_answers($student_question)};

                if (scalar(@student_checked_answers) == 1) {
                    my $student_answer = $student_checked_answers[0]->{'text'};

                    if (normalize_string($student_answer) eq normalize_string($correct_answer->{'text'})) {
                        $score++;
                    }
                }
            }
        }
    }
    say "$student_exam->{'source_file_name'} scored $score/30 points";
}
