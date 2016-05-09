#!/usr/bin/perl

use warnings;
use strict;

open my $fh, '<', 'file.txt' or die;

while ( my $line = <$fh> ){
    chomp $line;
    print "$line\n";
}
