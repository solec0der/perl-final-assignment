#! /usr/bin/env perl

use v5.34.0;
use strict;
use warnings;
use POSIX qw(strftime);
use File::Basename;

sub print_usage() {
  say "A command line utitlity for randomizing answers in a set of questions.";
  say "";
  say "Usage";
  say "  \$ ./create_exam.pl <PATH_TO_MASTER_EXAM_FILE>";
  say "Examples";
  say "  ./create_exam.pl _short_exam_master_file.txt"
}

my $master_file_name = $ARGV[0] || "";

if ($master_file_name eq "") {
  print_usage();
  exit(1);
}

if (not (-e $master_file_name)) {
  say qq{The specified file "$master_file_name" does not exist.};
  exit(1);
}

if (not (-r $master_file_name)) {
  say qq{The specified file "$master_file_name" is not readable.};
  exit(1);
}

my $opened = open(my $master_file_handle, $master_file_name);
if (!$opened) {
  warn qq{Unable to open file "$master_file_name": \n\t$!\nFailed};
  exit(1);
}

# Read file content into variable $file_content
my $file_content = "";

while (my $test = readline($master_file_handle)) {
  $file_content .= $test;
}



my @sections = split(/_{40,100}/, $file_content);

my $header = $sections[0];
my @questions = @sections[1..(scalar @sections - 2)];

my $final_result = $header;
$final_result .= "________________________________________________________________________________";

# Replace [X] with [ ] and randomize questions 
my $regex = qr/(\[X])/mp;
my $subst = '[ ]';

for (@questions) {
  $_ = $_ =~ s/$regex/$subst/rg;

  my @answers = $_ =~ m/(.*\[ ].*\n?)/g;
  my $answer_count = scalar @answers;

  my $new_answer_order = "";

  for (my $i = 0; $i < $answer_count; $i++) {
    my $rand_index = rand(scalar @answers);
    $new_answer_order .= $answers[$rand_index];
    splice(@answers, $rand_index, 1);
  }
  $_ = $_ =~ s/(.*\[ ].*\n?)//rg;
  $_ .= $new_answer_order;

  $final_result .= $_;
  $final_result .= "\n________________________________________________________________________________";
}

my $now_string = strftime "%Y%m%d-%H%M%S", localtime;
my $output_file_name = "$now_string-" . basename($master_file_name);

say $output_file_name;

$opened = open(my $output_file_handle, ">", $output_file_name);
if (!$opened) {
  warn qq{Unable to open file "$output_file_name": \n\t$!\nFailed};
  exit(1);
}

say $output_file_handle $final_result;

