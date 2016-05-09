#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my $str;

while ( my $line = <DATA> ){
    chomp $str;
    $str = $str.$line;
    say $str;
}

__DATA__
a
b
c
