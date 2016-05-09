#!/usr/bin/perl

use warnings;
use strict;

my @array;

open ("f", 'f.txt');

while(<f>) {
my $line= $_;
$line =~ s/\s*$//;

push @array, $line unless $line=~/^\s*$/;
}

my $txt = join("\n", @array) . "\n";

print $txt;



close(f)
