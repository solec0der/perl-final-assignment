package Exam::Parser;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use File::Util;
use List::Util 'shuffle';
use Exporter 'import';
our @EXPORT = ('parse_exam', 'uncheck_all_answers', 'randomize_order_of_answers', 'create_exam_file');

my $SEPARATOR = "________________________________________________________________________________";
my $SEPARATOR_LINE = qr/_{40,100}/xms;
my $QUESTION_LINE = qr/\d* \. \s* (?<question> .*?) ^$/xms;
my $ANSWER_LINE = qr/\s*(.* \[ [X | \s* ] ] .* \n?)/x;

my $ANSWER_UNCHECK_REGEX = qr/(\[X])/mp;
my $ANSWER_UNCHECK_SUBST = '[ ]';

sub parse_exam($file_content) {
    my %exam;

    my @sections = split($SEPARATOR_LINE, $file_content);
    $exam{'HEADER'} = $sections[0];
    $exam{'QUESTIONS'} = [];

    for my $raw_question (@sections[1 .. (scalar @sections - 2)]) {
        if ($raw_question =~ $QUESTION_LINE) {
            my %question;
            $question{'QUESTION_TEXT'} = $+{question};

            my @answer = $raw_question =~ m/$ANSWER_LINE/gx;
            $question{'ANSWERS'} = \@answer;

            push(@{$exam{'QUESTIONS'}}, \%question);
        }
    }
    return \%exam;
}

sub uncheck_all_answers($exam) {
    my $questions = $exam->{'QUESTIONS'};

    for my $question (@{$questions}) {
        for my $answer (@{$question->{'ANSWERS'}}) {
            $answer = $answer =~ s/$ANSWER_UNCHECK_REGEX/$ANSWER_UNCHECK_SUBST/rg;
        }
    }
}

sub randomize_order_of_answers($exam) {
    my $questions = $exam->{'QUESTIONS'};

    for my $question (@{$questions}) {
        @{$question->{'ANSWERS'}} = shuffle(@{$question->{'ANSWERS'}});
    }
}

sub create_exam_file($exam, $master_file_name) {
    my $final_result = "$exam->{'HEADER'}$SEPARATOR\n\n";
    my $questions = $exam->{'QUESTIONS'};

    for my $i (0 .. $#{$questions}) {
        my $question = ${$questions}[$i];
        my $question_number = $i + 1;
        $final_result .= "$question_number. $question->{'QUESTION_TEXT'}\n";

        for my $answer (@{$question->{'ANSWERS'}}) {
            $final_result .= "    $answer";
        }

        $final_result .= "\n$SEPARATOR\n\n\n"
    }

    my $output_file_name = create_filename_for_exam_file($master_file_name);
    write_content_to_file($final_result, $output_file_name);

    return $output_file_name;
}

1;