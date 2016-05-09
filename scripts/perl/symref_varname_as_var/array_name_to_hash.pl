#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my %data;
my $array_name;

while (my $line = <DATA>) {
    chomp($line);
    if ($line =~ /Array\s+(\w+)\s+(\d+)/) {
        $array_name = "table_" . $1 . "_" . $2;
        next;
    }
    my $value = (split /\s+/, $line)[1];
    push @{ $data{$array_name} }, $value;

}

print "Printing entire structure:\n";

print Dumper \%data;

print "\nPrinting all values from all arrays:\n\n";

for my $key (keys %data){
    print "in array '$key'\n";
    for my $elem (@{ $data{$key} }){
        print "$elem\n";
    }
}

print "\nPrinting values only from 'table_min_1':\n";

for my $item (@{ $data{'table_min_1'} }){
    print "$item\n";
}

__DATA__
Array max 1
useless_text_field a
useless_text_field b
useless_text_field c
Array max 2
useless_text_field 1
useless_text_field 2
useless_text_field 3
Array min 1
useless_text_field d
useless_text_field e
useless_text_field f
Array min 2
useless_text_field 4
useless_text_field 5
useless_text_field 6
