#!/usr/bin/perl

use warnings;
use strict;

my $lines = do { local $/; <DATA> };

$lines =~ s/\n*\n/ /g;

print "$lines\n";

__DATA__
Hello world!
This is a temp file.



Today is Saturday...
wohoo!
