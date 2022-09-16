package String::Util;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exporter 'import';
use Text::Levenshtein::XS qw(distance);

our @EXPORT = ('fuzzy_match_string', 'normalize_string');

my $LEVENSTEIN_MATCH_THRESHOLD = 0.1;
my @stop_words = ("the", "a", "an", "of", "and", "it", "for", "or", "but", "in");
my ($stop_words_regex) = map qr/(?:$_)/, join "|", map qr/\b\Q$_\E\b/, @stop_words;

sub fuzzy_match_string($string_1, $string_2) {
    # Normalize strings first to increase chance of finding a match
    $string_1 = normalize_string($string_1);
    $string_2 = normalize_string($string_2);

    # Calculate edit distance between string 1 and string 2
    my $distance = distance($string_1, $string_2);

    my $relative_distance_to_source_string = $distance / length($string_1);

    if ($relative_distance_to_source_string <= $LEVENSTEIN_MATCH_THRESHOLD) {
        return $string_2;
    }
    return undef;
}

sub normalize_string($string) {
    my $normalized_string = lc($string);          # to lower case
    $normalized_string =~ s/$stop_words_regex//g; # remove stop words
    $normalized_string =~ s/^\s+//g;              # trim leading white space
    $normalized_string =~ s/\s+$//g;              # trim trailing white space
    $normalized_string =~ s/\s+/ /g;              # replace any sequence of white spaces with single white space
    return $normalized_string;
}

1; # Magic true value required at end of module

=head1 NAME

String::Util - Module containing functions to manipulate strings (normalization and matching)

=head1 VERSION

This documentation refers to String::Util version 0.0.1

=head1 SYNOPSIS

    # Fuzzy match a string against another string
    # Returns the seconds string if it was able to match the second string against the first string.
    # Only returns a match, if the edit distance divided by the length of the first string is <= 0.1
    # Multiple normalization steps are also applied (to lower case, removal of stop words, substitution of any whitespace sequences with a single whitespace)
    my $source_string = "Hello world!";
    my $target_string = "Hallo world!";

    fuzzy_match_string($source_string, $target_string); # will return "hallo world!"

    # Normalizes a given string
    my $string = "This is a      string to normalize";
    my $normalized_string = normalize_string($string); # returns "this is string to normalize"
