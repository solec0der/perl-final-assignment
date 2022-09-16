#!/usr/bin/perl

use strict;
use warnings;
use Test::More;

use Exam::Parser;
use Data::Dumper;

plan tests => 7;

# Parse exam from master file
open my $exam_file, '<', './t/test_data/exam_1_master_file.txt'
    or die $!;

my $exam_file_content;
while (my $buffer = readline($exam_file)) {
    $exam_file_content .= $buffer;
}

my $actual_exam = parse_exam("source_file.txt", $exam_file_content);
my $expected_exam = do './t/test_data/exam_1.pl';

ok eof($exam_file), "Consumed entire contents of file";
is_deeply $actual_exam, $expected_exam, "The exam datastructures are identical";



# Parse exam file with multi line question

open $exam_file, '<', './t/test_data/exam_2_master_file_multiline_questions.txt'
    or die $!;

$exam_file_content = "";
while (my $buffer = readline($exam_file)) {
    $exam_file_content .= $buffer;
}

$actual_exam = parse_exam("source_file.txt", $exam_file_content);
$expected_exam = do './t/test_data/exam_2_multiline_questions.pl';

ok eof($exam_file), "Consumed entire contents of file";
is_deeply $actual_exam, $expected_exam, "The exam datastructures are identical with multiline questions";



# Parse exam file without questions

open $exam_file, '<', './t/test_data/exam_3_master_file_no_questions.txt'
    or die $!;

$exam_file_content = "";
while (my $buffer = readline($exam_file)) {
    $exam_file_content .= $buffer;
}

$actual_exam = parse_exam("source_file.txt", $exam_file_content);
$expected_exam = do './t/test_data/exam_3_no_questions.pl';

ok eof($exam_file), "Consumed entire contents of file";
is_deeply $actual_exam, $expected_exam, "The exam datastructures are identical without questions";



# Make sure, that answers get unchecked properly
my $TEST_CASE = "All answers must be unchecked";

my $exam = do './t/test_data/exam_1.pl';

uncheck_all_answers($exam);

my $questions = $exam->{'QUESTIONS'};
my $all_answers_unchecked = 1;

for my $question (@{$questions}) {
    for my $answer (@{$question->{'ANSWERS'}}) {
        if ($answer =~ /\[X]/) {
            $all_answers_unchecked = 0;
        }
    }
}
if ($all_answers_unchecked) {
    pass $TEST_CASE;
} else {
    fail $TEST_CASE;
}

done_testing();
