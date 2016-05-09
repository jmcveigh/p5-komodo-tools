#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my @array = ( 'aa'..'zz' );

while ( my ( $i, $elem ) = each @array ){
    if ( $i != 0 && $i % 20 == 0 ){
        say "Hit ENTER to continue...";
        <STDIN>;
    }
    say $elem;
}

