#!/usr/bin/perl

use warnings;
use strict;

open my $f, '<', 'f.txt' or die "Can't open file: $!";
my @data = <$f>;
close $f;

my @rev = reverse @data;

for my $elem ( @rev ){
    last if $elem !~ /^\s*$/ ;
    pop @data;
}
print @data;
