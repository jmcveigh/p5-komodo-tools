#!/usr/bin/perl

use strict;
use warnings;

open my $fh, '<', "list.txt" or die "Can't open list.txt: $!";

chomp($line = <IN>);
     ($element, @abc) = split /\s+/, $line;
     while (chomp($line = <IN>)) {
     ($values, @xyz) = split /\s+/, $line;
     for ($i=0; $i<@xyz; $i++) {
     $s{$values}{$abc[$i]} = $xyz[$i];
        }
    }
    close(IN);
