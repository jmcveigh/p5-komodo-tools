#!/usr/bin/perl

use warnings;
use strict;

my @a = qw(0 1 2);
my $air = $a[0];

@a = qw(a b c);

say $$air;
