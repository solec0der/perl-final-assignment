#! /usr/bin/env perl

use v5.34.0;
use strict;
use warnings;
use POSIX qw(strftime);

use File::Basename;
use List::Util qw(shuffle);
use IO::Util;

sub print_usage() {
  say "A command line utitlity for randomizing answers in a set of questions.";
  say "";
  say "Usage";
  say "  \$ ./create_exam.pl <PATH_TO_MASTER_EXAM_FILE>";
  say "Examples";
  say "  ./create_exam.pl _short_exam_master_file.txt"
}

my $separator = "________________________________________________________________________________";

my $master_file_name = $ARGV[0] || "";

if ($master_file_name eq "") {
  print_usage();
  exit(1);
}

my $master_file_handle = open_file($master_file_name, 1, "<");

# Read file content into variable $file_content
my $file_content = "";

while (my $test = readline($master_file_handle)) {
  $file_content .= $test;
}

my @sections = split(/_{40,100}/, $file_content);

my $header = $sections[0];
my @questions = @sections[1..(scalar @sections - 2)];

my $final_result = $header;
$final_result .= $separator;

# Replace [X] with [ ] and randomize questions 
my $regex = qr/(\[X])/mp;
my $subst = '[ ]';

for (@questions) {
  $_ = $_ =~ s/$regex/$subst/rg;

  my @answers = $_ =~ m/(.*\[ ].*\n?)/g;
  my @new_answer_order = shuffle(@answers);

  $_ = $_ =~ s/(.*\[ ].*\n?)//rg;
  $_ .= join("\n", @new_answer_order);

  $final_result .= $_;
  $final_result .= "\n$separator";
}

my $now_string = strftime "%Y%m%d-%H%M%S", localtime;
my $output_file_name = "$now_string-" . basename($master_file_name);

my $output_file_handle = open_file($output_file_name, 0, ">");

say $output_file_handle $final_result;

say "The final exam file was written to the file $output_file_name";

print "Would you like to open the file in vim? (y/n) [n]: ";
my $openFile = <STDIN>;
chomp $openFile;

if ($openFile eq "y") {
  system("vim", $output_file_name);
}
