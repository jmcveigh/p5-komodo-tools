#!/usr/bin/perl

use strict;
use warnings;
use 5.12.0;

my $line = "uh]MRajosephnkillcppl[" ;
my @hashBox = qw(a n c [ ]);

for my $i ( keys @hashBox ){    
    $line =~ s/\Q$hashBox[$i]/a/ig;
}

while ( my ( $i, $elem ) = each @hashBox ){
    say "$elem is in array slot $i";
}


