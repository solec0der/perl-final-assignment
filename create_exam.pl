#! /usr/bin/env perl

use v5.30.3;
use strict;
use warnings;

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


#####
#
# Steps:
#
# Separate in header (containing description of test and also form for name and student id) and
# questions section. That way, we can easily manipulate the questions section without affecting the description.
#
# In the end, we simply merge it back.
#
#####
my @sections = split(/_{40,100}/, $file_content);

my $header = $sections[0];
my @questions = @sections[1..(scalar @sections - 1)];


# Replace [X] with [ ] and randomize questions 
my $regex = qr/(\[X])/mp;
my $subst = '[ ]';

for (@questions) {
  $_ = $_ =~ s/$regex/$subst/rg;

  my @answers = $_ =~ m/(.*\[ ].*\n?)/g;

  # if ($answers[5]) {
  #   say $answers[5];
  # }
}



# $file_content = $file_content =~ s/$regex/$subst/rg;

# say $file_content;
