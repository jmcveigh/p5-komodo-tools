#!/usr/bin/perl  

use strict;
use warnings;
use Data::Dumper;

use List::Util qw( first );

my @array1 = ( "proc1", "proc2", "proc3", "proc4" );
my @array2 = ( "proc1", "proc2", "proc3", "proc4", "proc5" );

my %HoA = (
            prebuilds  => [@array1],
            postbuilds => [@array2],
);

for my $prebuild ( @{ $HoA{ prebuilds } } ){

    print "$prebuild: ";

    if ( first { $_ =~ $prebuild } @{ $HoA{ postbuilds } } ){
        print "yes\n";
    }
    else {
        print "no\n";
    }
}

