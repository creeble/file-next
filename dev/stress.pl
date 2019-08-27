#!perl

use strict;
use warnings;
use File::Next;

my @start = @ARGV or die 'Must specify a starting directory.';
my $iter = File::Next::files( {
    descend_filter  => sub { $_ ne '.svn' && $_ ne '.git' },
    sort_files      => \&File::Next::sort_standard,
}, @start );

my $nfiles;
while ( my $file = $iter->() ) {
    ++$nfiles;
}
print "$nfiles files processed.\n";
