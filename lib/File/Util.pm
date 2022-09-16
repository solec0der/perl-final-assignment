package File::Util;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use POSIX qw(strftime);
use File::Basename;
use Exporter 'import';
our @EXPORT = ('load_file', 'create_filename_for_exam_file', 'write_content_to_file');

sub load_file($file_name) {
    my $file_handle = open_file($file_name, 1, "<");
    return do { local $/; readline($file_handle); };
}

sub open_file($file_name, $check_if_file_exists, $mode) {
    if ($check_if_file_exists && not (-e $file_name)) {
        say qq{The specified file "$file_name" does not exist.};
        exit(1);
    }

    if ($check_if_file_exists && not (-r $file_name)) {
        say qq{The specified file "$file_name" is not readable.};
        exit(1);
    }

    my $opened = open(my $file_handle, $mode, $file_name);
    if (!$opened) {
        warn qq{Unable to open file "$file_name": \n\t$!\nFailed};
        exit(1);
    }

    return $file_handle;
}

sub create_filename_for_exam_file ($master_file_name) {
    my $now_string = strftime "%Y%m%d-%H%M%S", localtime;
    return "$now_string-" . basename($master_file_name);
}

sub write_content_to_file ($file_content, $file_name) {
    my $output_file_handle = open_file($file_name, 0, ">");
    say $output_file_handle $file_content;
}

1; # Magic true value required at end of module
__END__

=head1 NAME

File::Util - Functions to interact with files (reading files into variables, writing to files, etc.)

=head1 VERSION

This documentation refers to File::Util version 0.0.1

=head1 SYNOPSIS

    use File::Util;

    my $file_name = "file.txt";

    # Load file content into string variable
    my $file_content = load_file($file_name);

    # Create filename for exam file (will output something like 20220916-162350_source_file_name.txt)
    my $master_file_name = "_source_file_name.txt";
    my $exam_file_name = create_filename_for_exam_file($master_file_name);

    # Write content of string variable to file
    my $file_content = "This is some text";
    my $file_name = "file_name.txt";
    write_content_to_file($file_content, $file_name);
