#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my @array1 = ( "1 2 3 4 5", "2 3 4 5 6", "3 4 5 6 7" );
my @array2 = ( "a b c d", "b c d e", "f g h i" );

my @join;

for my $elem ( @array1 ){
    push @join, "$elem " . shift @array2; 
}

print "$_\n" for @join;
