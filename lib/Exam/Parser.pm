package Exam::Parser;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use File::Util;
use Exporter 'import';
our @EXPORT = ('parse_exam');

my $SEPARATOR = "________________________________________________________________________________";
my $SEPARATOR_LINE = qr/_{40,100}/xms;
my $QUESTION_LINE = qr/\d* \. \s* (?<question> .*?) ^$/xms;
my $ANSWER_LINE = qr/\s*(.* \[ [X | \s* ] ] .* \n?)/x;

sub parse_exam ($file_handle) {
    my %exam;
    my $file_content = load_file($file_handle);

    my @sections = split($SEPARATOR_LINE, $file_content);
    $exam{'HEADER'} = $sections[0];
    $exam{'QUESTIONS'} = [];

    for my $raw_question (@sections[1..(scalar @sections - 2)]) {
        if ($raw_question =~ $QUESTION_LINE) {
            my %question;
            $question{'QUESTION_TEXT'} = $+{question};

            my @answer = $raw_question =~ m/$ANSWER_LINE/gx;
            $question{'ANSWERS'} = \@answer;

            push(@{$exam{'QUESTIONS'}}, \%question);
        }
    }
    return \%exam;
}

1;