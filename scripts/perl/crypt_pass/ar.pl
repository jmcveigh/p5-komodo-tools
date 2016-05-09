#!/usr/bin/perl

use warnings;
use strict;

my @a = qw( 1 2 3 4 5 6 7 8 9 );
my @b = qw( 1 2 3 4 );

my @hold;

push @hold, @b until @hold > @a;

print map { $_, ' ' } @hold;
