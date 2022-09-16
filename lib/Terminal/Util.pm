package Terminal::Util;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exporter 'import';
our @EXPORT = ('prompt_if_file_should_be_opened_in_editor', 'print_usage_for_create_exam_script', 'print_usage_for_score_exams_script', 'print_separator');

sub prompt_if_file_should_be_opened_in_editor($file_name) {
    print "Would you like to open the file in vim? (y/n) [n]: ";
    my $openFile = <STDIN>;
    chomp $openFile;

    if ($openFile eq "y") {
        system("vim", $file_name);
    }
}

sub print_usage_for_create_exam_script() {
    say "A command line utility for randomizing answers in a set of questions.";
    say "";
    say "Usage";
    say "  \$ ./create_exam.pl <PATH_TO_MASTER_EXAM_FILE>";
    say "Examples";
    say "  ./create_exam.pl _short_exam_master_file.txt"
}

sub print_usage_for_score_exams_script() {
    say "A command line utility for scoring and evaluating completed exams according to a masterfile containing the correct answers.";
    say "";
    say "Usage";
    say "  \$ ./score_exams.pl <PATH_TO_MASTER_EXAM_FILE> <GLOBBING_PATTERN_TO_EXAM_FILES>";
    say "Examples";
    say "  ./score_exams.pl _short_exam_master_file.txt *completed_exam.txt"
}

sub print_separator() {
    say "================================================================================";
}