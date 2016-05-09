#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my $search = "one";
my %words;

my $string = "one two one three one four two";

foreach my $word ( split( /\s+/, $string ) ){
    $words{ $word }++;
}

say $words{ $search };

