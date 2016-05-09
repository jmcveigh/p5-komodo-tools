#!/usr/bin/perl

use warnings;
use strict;

use Time::Piece;

for my $entry (<DATA>){
    chomp $entry;

    next if length($entry) > 14;

    my $date;

    eval {
        $date = Time::Piece->strptime($entry, "%Y%m%d%H%M%S");
    };
    if ($@){
        next;
    }

    print "$date\n";
}

__DATA__
20150608141617
20152525252525
201506081413454
20150608141649
20150608141506
20150608141618
20150608141545
