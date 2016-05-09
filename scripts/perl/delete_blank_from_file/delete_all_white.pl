#!/usr/bin/perl

use warnings;
use strict;

open my $fh, '<', 'f.txt' or die "Can't open f.txt: $!";

my @array;

while ( my $line = <$fh> ){
    push @array, $line unless $line =~ /^\s*$/;
}

print @array;
