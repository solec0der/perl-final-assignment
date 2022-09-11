#! /usr/bin/env perl

use v5.30.3;
use strict;
use warnings;

use File::Util;
use Exam::Parser;
use Exam::Evaluator;
use Terminal::Util;
use Data::Dump 'dump';
use File::Glob ':glob';

my $master_file_name = $ARGV[0] || "";
my @student_exam_file_names;

foreach my $i (1..$#ARGV) {
  push(@student_exam_file_names, $ARGV[$i]);
}

if ($master_file_name eq "" || $master_file_name eq "help" || scalar(@student_exam_file_names) == 0) {
  print_usage_for_score_exams_script();
  exit(1);
}

my $master_file_content = load_file($master_file_name);
my $master_exam = parse_exam($master_file_name, $master_file_content);

my @student_exams;


for my $student_exam_file_name (@student_exam_file_names) {
  my $file_content = load_file($student_exam_file_name) || '';
  push(@student_exams, parse_exam($student_exam_file_name, $file_content));
}

my $reports = score_exams($master_exam, \@student_exams);



print_missing_questions_and_answers($reports);

