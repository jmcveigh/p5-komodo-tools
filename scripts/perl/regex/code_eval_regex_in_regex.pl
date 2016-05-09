#!/usr/bin/perl
use warnings;
use strict;

my %bad;

while (<DATA>){
    chomp;

    my @cts;
    
    my ($t, $p, $s, $d) 
      = (/^([A-Z]\d\d)\s+       # $t
          (1?\d)\s+             # $p
          (\d?\d(?:\.1)?)\s+    # $s
          ([0-3])\s+            # $d
          (?{@cts = $' =~ m#(\d?\d\.\d)#g}) # @cts
          /x) 
       or ($bad{$_}++) && next;

    print join(' ', @cts);
    print "\n";
}

print "\nPrinting bad lines:\n";

while (my ($k, $v) = each %bad){
    print "$k: $v\n";
}
__DATA__
C31 6 3 2.4 1.5 2.6  
C31 6 3 2.4 1.5 2.6  
C32 2 7 3 1.0  
H31 1 1 0 21.0 11.2 5.3 1.4
T11 2 1 0 6.0 1.1 2.2
L06 1 1 0 1.0 3.3
L06 1 4 0 1.1 1.8
