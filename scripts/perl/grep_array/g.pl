#!/usr/bin/perl

use warnings;
use strict;

use List::MoreUtils qw (any);

my @a = qw( 1 2 3 4 5 );
my @b = qw( 9 2 3 8 3 );

my @z;

for my $elem ( @a ){
    push @z, ( any { $_ eq $elem } @b ) ? '+' : '-';
}

print @z;
