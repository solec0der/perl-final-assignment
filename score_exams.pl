#! /usr/bin/env perl

use v5.30.3;
use strict;
use warnings;

use File::Util;
use Exam::Parser;
use Terminal::Util;
use Data::Dump 'dump';

my $master_file_name = $ARGV[0] || "";
my $exam_files_globbing_pattern = $ARGV[1] || "";

if ($master_file_name eq "" || $master_file_name eq "help" || $exam_files_globbing_pattern eq "") {
    print_usage_for_score_exams_script();
    exit(1);
}

my $master_file_content = load_file($master_file_name);
my $exam = parse_exam($master_file_content);

my @files = glob($exam_files_globbing_pattern);

dump(@files);
