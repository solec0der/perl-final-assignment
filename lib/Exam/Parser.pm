package Exam::Parser;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use File::Util;
use File::Basename;
use List::Util 'shuffle';
use Exporter 'import';
our @EXPORT = (
    'parse_exam',
    'uncheck_all_answers',
    'randomize_order_of_answers',
    'create_exam_file',
    'get_checked_answers');

use Regexp::Grammars;

# Grammar to parse an exam file into a hash data structure which can be used for further processing
my $EXAM_GRAMMAR = qr{
    <exam>
    <nocontext:>

    <rule: exam>
        <header>
        <[questions]>+ % <.separator>

    <token: header>
        .*? <.separator>

    <token: separator>
        ^ \h* _+ \h* \n

    <rule: questions>
        <question>
        <[answers]>+

    <token: question>
        ^ \h* <number> \. \h* <text>

    <token: answers>
        ^ \h* <checkbox> \h* <text>

    <token: number>
        \d+

    <token: checkbox>
        \[ [^]\v]* \]

    <token: text>
        \N* \n
        (?: <!answers> ^ \N* \S \N* \n )*
}xms;

my $SEPARATOR = "________________________________________________________________________________";
my $ANSWER_CHECKED_REGEX = qr/(\[[xX]])/mp;

sub parse_exam($source_file_name, $file_content) {
    # Parses an exam file from a string to a hash data structure using a Grammar.
    my $exam;
    if ($file_content =~ $EXAM_GRAMMAR) {
        $exam = $/{exam};
    }
    $exam->{'source_file_name'} = basename($source_file_name);

    return $exam;
}

sub uncheck_all_answers($exam) {
    my $questions = $exam->{'questions'};

    for my $question (@{$questions}) {
        for my $answer (@{$question->{'answers'}}) {
            $answer->{'checkbox'} = "[ ]";
        }
    }
}

sub randomize_order_of_answers($exam) {
    my $questions = $exam->{'questions'};

    for my $question (@{$questions}) {
        @{$question->{'answers'}} = shuffle(@{$question->{'answers'}});
    }
}

sub get_checked_answers($question) {
    my @all_answers = @{$question->{'answers'}};
    my @checked_answers;

    for my $answer (@all_answers) {
        if (is_answer_checked($answer->{'checkbox'})) {
            push(@checked_answers, $answer);
        }
    }
    return \@checked_answers;
}

sub is_answer_checked($answer) {
    return $answer =~ $ANSWER_CHECKED_REGEX ? 1 : 0;
}

sub create_exam_file($exam, $master_file_name) {
    # Turns an exam hash data structure into a file with the same structure as the source exam file.
    my $final_result = "$exam->{'header'}\n";
    my $questions = $exam->{'questions'};

    for my $question (@{$questions}) {
        my $question_number = $question->{'question'}->{'number'};
        my $question_text = $question->{'question'}->{'text'};

        $final_result .= "$question_number. $question_text\n";

        for my $answer (@{$question->{'answers'}}) {
            $final_result .= "    [ ] $answer->{'text'}";
        }

        $final_result .= "\n$SEPARATOR\n\n\n";
    }

    my $output_file_name = create_filename_for_exam_file($master_file_name);
    write_content_to_file($final_result, $output_file_name);

    return $output_file_name;
}

1; # Magic true value required at end of module

=head1 NAME

Exam::Parser - Module to parse exam files into a perl datastructure and create exam files from that datastructure.

=head1 VERSION

This documentation refers to Exam::Parser version 0.0.1

=head1 SYNOPSIS

    use Exam::Parser;

    my $file_name = "_source_exam_file.txt";

    # Read an exam into a variable as a string
    my $exam_content = do { local $/; readline($file_handle); };

    # Create datastructure from file content
    my $exam = parse_exam($file_name, $exam_content);

    # Randomize the order of answers
    randomize_order_of_answers($exam);

    # Uncheck all answers (useful, when creating an exam file for students)
    uncheck_all_answers($exam);

    # Get checked answers (returns an array of all checked answers of a question)
    get_checked_answers($question);

    # Create a new text file from the exam datastructure
    create_exam_file($exam, $file_name);
