#!/usr/bin/perl

use strict;
use warnings;
use 5.10.0;

use Data::Dumper;

my %proteins;

while ( my $entry = <DATA> ){    

    for my $letter ('A' .. 'Z'){

        my ( $variant, $seq ) = split( /\s+/, $entry );
   
        push @{ $proteins{ $letter }{ start } }, $variant 
          if $seq =~ /^$letter/;
 
        push @{ $proteins{ $letter }{ end } }, $variant
          if $seq =~/$letter$/;
    }
}

print Dumper \%proteins;

__DATA__
Variant_1 MQFLSVTVGDVLTEDPFLSPVVVESDFVKYESKFENHVSGTIKTVLGKVK
Variant_2 ---------------------VLESDFVKYEGKFANHVSGTLETALGKVM
Variant_3 YQFLSLTLGDVLIEDQFPSPVVVESDFVKYEGKFANHVSGTLETALGKV-
Variant_4 YQFLSLTLGDVLIEDQFPSP-----------------------------K
Variant_5 YQFLSLTLGDVLIEDRFPSPVVVESDFVKYEGKFANHVSGTLETALGKVK

