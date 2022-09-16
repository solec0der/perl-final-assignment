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

# Reads the globbed file names of the student exam file into an array
foreach my $i (1..$#ARGV) {
  push(@student_exam_file_names, $ARGV[$i]);
}

# If the script was used incorrectly or the help command was issued, the usage for this script is printed
if ($master_file_name eq "" || $master_file_name eq "help" || scalar(@student_exam_file_names) == 0) {
  print_usage_for_score_exams_script();
  exit(1);
}

# Load master exam file into a hash data structure.
my $master_file_content = load_file($master_file_name);
my $master_exam = parse_exam($master_file_name, $master_file_content);


# Load all student exam files into has data structures.
my @student_exams;

for my $student_exam_file_name (@student_exam_file_names) {
  my $file_content = load_file($student_exam_file_name) || '';
  push(@student_exams, parse_exam($student_exam_file_name, $file_content));
}

# Score all exams using the master exam file and return reports of each exam
my $reports = score_exams($master_exam, \@student_exams);

say "\n\n";
print_separator();
say "=== Issues ===";
print_separator();

say "\n\nThe following issues were found while evaluating the exams. These exams might need further manual investigation:\n\n";

print_missing_questions_and_answers($reports);
