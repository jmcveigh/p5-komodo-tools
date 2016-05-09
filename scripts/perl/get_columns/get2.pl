#!/usr/bin/perl

use warnings;
use strict;

use List::Util qw( first );

my @master_cols = qw( NAME CITY );

my @results;
my %positions;

while ( my $line = <DATA> ){
    
    chomp $line;

    my @row = split /\|/, $line;

    if ( $. == 1 ){
        while ( my ( $i, $elem ) = each @row ){
            if ( first { $elem eq $_ } @master_cols ){
                $positions{ $elem } = $i;
            }
        }
    }

    my @row_items;

    for my $pos ( sort values %positions ){
        push @row_items, $row[ $pos ];
    }
    push @results, [ @row_items ];
}

for my $result ( @results ){
    print "\n";
    print join '|', @{ $result };
}

__DATA__
NAME|AGE|CITY|ZIP
AAA|23|STAT|60001
BBB|34|PPOR|12345
CCC|11|TRET|2345
