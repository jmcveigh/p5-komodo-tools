#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my @a = ( 1, 2, 3 );
my %h = ( a => 1, b => 2, c => 3 );

# take a reference to the array

my $aref = \@a;

# take a reference to the hash

my $href = \%h;

# access the entire array through its reference

my $elem_count = scalar @{ $aref };

# access the entire hash through its reference

my $keys_count = keys %{ $href };

# get a single element through the array reference

my $element = $a->[0];

# get a single value through the hash reference

my $value = $h->{ a };

# assign to a single array element through its reference

$a->[0] = 1;

# assign a value to a single hash key through its ref

$h->{ a } = 1;


