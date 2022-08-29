#! /usr/bin/env perl

use v5.30.3;
use strict;
use warnings;

use File::Util;
use Exam::Parser;
use Terminal::Util;
use Data::Dump 'dump';
use File::Glob ':glob';

my $master_file_name = $ARGV[0] || "";
my @student_exam_file_names;

foreach my $i (1..$#ARGV) {
  push(@student_exam_file_names, $ARGV[$i]);
}

if ($master_file_name eq "" || $master_file_name eq "help" || $#student_exam_file_names == 0) {
  print_usage_for_score_exams_script();
  exit(1);
}

my $master_file_content = load_file($master_file_name);
my $master_exam = parse_exam($master_file_content);

my @student_exams;

for my $student_exam_file_name (@student_exam_file_names) {
  my $file_content = load_file($student_exam_file_name);
  push(@student_exams, parse_exam($file_content));
}

