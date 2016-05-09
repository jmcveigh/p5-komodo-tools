#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;
use List::Util qw( first );
use Data::Dumper;

my @master_cols = qw( NAME CITY );
my %results;

my $n = 1;
while ( my $line = <DATA> ){
    
    chomp $line;

    my @row = split /\|/, $line;

    if ( $n == 1 ){
        while ( my ( $i, $elem ) = each @row ){
            if ( first { $elem eq $_ } @master_cols ){
                $results{ $elem }{ pos } = $i;
            }
        }
        $n++;
    }

    for my $col_name ( keys %results ){
        push @{ $results{ $col_name }{ rows } }, 
          $row[ $results{ $col_name }{ pos  } ];
    }
}

for my $col ( keys %results ){
    for my $pos ( sort values %{ $results{ $col }{ pos } } ){
        print join '|', @{ $results{ $col }{ row } };
    }
}
__DATA__
NAME|AGE|CITY|ZIP
AAA|23|STAT|60001
BBB|34|PPOR|12345
CCC|11|TRET|2345
