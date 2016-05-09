#!/usr/bin/perl

use strict;
use warnings;
use 5.10.0;

my ( $letter ) = @ARGV;

while ( my $entry = <DATA> ){    

    my ( $variant, $seq ) = split( /\s+/, $entry );

      
}


__DATA__
Variant_1 MQFLSVTVGDVLTEDPFLSPVVVESDFVKYESKFENHVSGTIKTVLGKVK
Variant_2 ---------------------VLESDFVKYEGKFANHVSGTLETALGKVM
Variant_3 YQFLSLTLGDVLIEDQFPSPVVVESDFVKYEGKFANHVSGTLETALGKV-
Variant_4 YQFLSLTLGDVLIEDQFPSP-----------------------------K
Variant_5 YQFLSLTLGDVLIEDRFPSPVVVESDFVKYEGKFANHVSGTLETALGKVK

