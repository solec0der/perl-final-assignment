package String::Util;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exporter 'import';
use Text::Levenshtein::XS qw(distance);

use Data::Dumper;

our @EXPORT = ('fuzzy_match_string', 'fuzzy_match_strings' , 'normalize_string');

my $LEVENSTEIN_MATCH_THRESHOLD = 0.1;
my @stop_words = ("the", "a", "an", "of", "and", "it", "for", "or", "but", "in");
my ($stop_words_regex) = map qr/(?:$_)/, join "|", map qr/\b\Q$_\E\b/, @stop_words;

sub fuzzy_match_string($string_1, $string_2) {
    $string_1 = normalize_string($string_1);
    $string_2 = normalize_string($string_2);

    my $distance = distance($string_1, $string_2);
    my $relative_distance_to_source_string = $distance / length($string_1);

    if ($relative_distance_to_source_string <= $LEVENSTEIN_MATCH_THRESHOLD) {
        return $string_2;
    }
    return undef;
}

sub normalize_string($string) {
    my $normalized_string = lc($string);
    $normalized_string =~ s/$stop_words_regex//g;
    $normalized_string =~ s/^\s+|\s+$//g;
    $normalized_string =~ s/\s+/ /g;
    return $normalized_string;
}
