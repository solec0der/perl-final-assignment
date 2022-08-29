package File::Util;

use v5.30.3;
use strict;
use warnings;
use experimental 'signatures';

use Exporter 'import';
our @EXPORT = ('open_file', 'load_file');

sub open_file ($file_name, $check_if_file_exists, $mode) {
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

sub load_file ($file_handle) {
  my $file_content;
  while (my $buffer = readline($file_handle)) {
    $file_content .= $buffer;
  }
  return $file_content;
}

1; # Magic true value required at end of module
__END__

=head1 NAME

File::Tools - "DESCRIPTION"

