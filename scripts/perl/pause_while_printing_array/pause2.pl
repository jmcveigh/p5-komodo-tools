#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my @array = ( 'aa'..'zz' );

my $i = 0;
for my $elem ( @array ){
    if ( $i != 0 && $i % 20 == 0 ){
        say "Hit ENTER to continue...";
        <STDIN>;
    }
    say $elem;
    $i++;
}

