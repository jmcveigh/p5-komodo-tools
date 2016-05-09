#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

{ # example @a

# define an array and print its
# contents

my @array = ( 1, 2, 3 );

for my $elem ( @array ){
    say $elem;
}

# take a reference to an array and assign it to 
# the $aref scalar, and print the contents of
# the arraaaaaaaaaaay through the array 
# reference

my $aref = \@array;

for my $elem ( @{ $aref } ){
    say $elem;
}

# take an element from the array directly

my $x  = $array[0];

# take an element from the array through
# the array reference

my $y = $aref->[1];

# assign a string to the second array element

$array[1]  = "assigning to array element 2";

# assign a string to the second array element
# through the reference

$aref->[1] = "assigning to array element 2";

} # end example @a

{ #example @b

say "***";

my @b = ( 1, 2, 3 );
my $aref = \@b;

# print the first array element

say $b[0];

# assign a new value to $a[0] through the reference

$aref->[0] = 99;

# print the array

for my $elem ( @b ){
    say $elem;
}

} # end example @b
