#!/usr/bin/perl

use strict;
use warnings;
use 5.10.0;

my ( $letter, $location ) = @ARGV;

while ( my $entry = <DATA> ){    

    $location = 'none' if ! $location;

    my ( $variant, $seq ) = split( /\s+/, $entry );
  
    given ( $location ){
       when (/start/) {
          say $variant if $seq =~ /^$letter/; 
       }
       when (/end/) {
           say $variant if $seq =~ /$letter$/;
       }
       default {
           say $variant if ( $seq =~ /^$letter/ || $seq =~ /$letter$/ );
        }
    }
}


__DATA__
Variant_1 MQFLSVTVGDVLTEDPFLSPVVVESDFVKYESKFENHVSGTIKTVLGKVK
Variant_2 ---------------------VLESDFVKYEGKFANHVSGTLETALGKVM
Variant_3 YQFLSLTLGDVLIEDQFPSPVVVESDFVKYEGKFANHVSGTLETALGKV-
Variant_4 YQFLSLTLGDVLIEDQFPSP-----------------------------K
Variant_5 YQFLSLTLGDVLIEDRFPSPVVVESDFVKYEGKFANHVSGTLETALGKVK

