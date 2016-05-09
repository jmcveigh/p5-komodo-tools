#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my $x = sub { say "hi"; }; 
my $y = sub { say "bye";}; 

# note the b => $a order
my %subs = ( y => $x, x => $y ); 

$subs{ (sort keys %subs)[0] }->();
