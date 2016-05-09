#!/usr/bin/perl

use warnings;
use strict;

open my $tempvt_fh, '<', 'tempvt.txt'or die $!;

while ($line = <$tempvt_fh>){         
    ($datecompare,$id) = split /\s/, $line ;
    if ($datecompare > 1)  {
        print "$line" ;
        next;
    }
}  

__DATA__
1
2
3
