#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

open my $find_file, '<', 'ids.txt' or die "$!";
open my $grep_file, '<', 'file.txt' or die "$!";

my %search_terms;

# suck in the search terms

while ( my $line = <$find_file> ){
    
    chomp $line;
    $search_terms{ $line } = 0;
}
close $find_file;

# compare each line 

while ( my $line = <$grep_file> ){
    
    chomp $line;
    for my $term ( keys %search_terms ){
        $search_terms{ $term }++ if $line =~ /$term/;
    }
}
close $grep_file;

open my $res_file,  '>', 'results.txt' or die "Can't open results: $!";

# dump results

while ( my ($k,$v) = each %search_terms ){
    print $res_file "$k\n" if $v;
}
close $res_file;
