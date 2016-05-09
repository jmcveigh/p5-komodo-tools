#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

use Data::Dumper;

my @bb  = ( 41..60 );
my @cc  = ( 21..40 );
my @IDs = ( 1..20 );
my %An;

my $idx = 0;
 
foreach my $n (@IDs) {
    push @{$An{$n}->{b}} , $bb[$idx];
    push @{$An{$n}->{c}} , $cc[$idx];
    $idx++;
}

#print Dumper \%An;
#exit;

# $An{$id}->{b} is an array reference
# to access its elements, we must dereference it
# by encompassing the data structure within the
# array dereferencing operators: @{}

# to iterate over the entire array reference
# note the @{} block surrounding the data structure

say map { $_, ' ' } @{ $An{1}->{b} };

# to print out a single element of the aref
# we have to treat the array portion as a list
# so we encompass it in parens

say @{ $An{1}->{b} }[0];

# to print out the zeroeth element contained
# in the 'b' value of each %An ID key:

for my $id ( @IDs ){
    say @{ $An{ $id }->{ b } }[ 0 ];
}
