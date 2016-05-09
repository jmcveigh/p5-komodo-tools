#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

use List::Util qw ( first );

my @a = qw ( a b c );

my $ret = first { $_ =~ /b/ } @a; 

say $ret;

