#!/usr/bin/perl

use warnings;
use strict;

my $string = "I have; in my string; replace all but last one;This is the end";

$string =~ s/;(?=.*;)//g;

print $string;
