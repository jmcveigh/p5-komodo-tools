#!/usr/bin/perl

use warnings;
use strict;

my %words;

while ( my $word = <DATA> ){
	chomp $word;
	$words{$word}++;
}

for my $key ( sort( keys( %words ))) {
	print "$key: $words{$key}\n";
}

__DATA__
me
myself
you
this
that
other
this
them
after
before
after
you
you
