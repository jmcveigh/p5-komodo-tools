#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my %h1 = ( a => 1, b => 2, c => 3, e => 5, );
my %h2 = ( a => 2, b => 2, d => 4, e => 5, );

my @filenames;

while ( my ( $k, $v ) = each %h1 ) {
    if ( exists $h2{ $k } ) {
        push @filenames, $k if $v == $h2{ $k };
    }
}

say "$_" for @filenames;
