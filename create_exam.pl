#! /usr/bin/env perl

use v5.30.3;
use strict;
use warnings;

use File::Util;
use Exam::Parser;
use Terminal::Util;

my $master_file_name = $ARGV[0] || "";

if ($master_file_name eq "" || $master_file_name eq "help") {
    print_usage_for_create_exam_script();
    exit(1);
}

my $master_file_content = load_file($master_file_name);
my $exam = parse_exam($master_file_content);

uncheck_all_answers($exam);
randomize_order_of_answers($exam);

my $output_file_name = create_exam_file($exam, $master_file_name);

say "The final exam file was written to the file $output_file_name";

prompt_if_file_should_be_opened_in_editor($output_file_name);