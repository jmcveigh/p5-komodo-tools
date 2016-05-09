#!/usr/bin/perl  
 
use strict; 
use warnings;  

my $infile = "xyz.txt";  

open my $fh, '<', $infile or die ("can't open file:$!");  

my %seen;

while ( my $line = <$fh> ){

    next if $line !~ /Enter:/;
    chomp $line;
    $line =~ s/Enter:\s*//; 
    $seen{ $line }++;

}

# print all entries only once

print "All:\n";

print "$_\n" for keys %seen;

# print only unique items

print "\nUnique:\n";

for my $key ( keys %seen ){
    print "$key\n" if $seen{ $key } == 1;
}

