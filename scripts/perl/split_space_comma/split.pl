#!/usr/bin/perl

use warnings;
use strict;

open my $fh, "<", "infos.txt" or die "cannot open infos.txt: $!";

while ( my $line = <$fh> ){
    chomp $line;

    my ( $name, $rest ) = split /\s+/, $line;

    my ( $age, $gender, $address ) = split /,/, $rest;

    print "Name:    $name\n";
    print "Age:     $age\n";
    print "Gender:  $gender\n";
    print "Address: $address\n";
    print "\n";
}
    
