#!/usr/bin/perl

use warnings;
use strict;

use YAPE::Regex::Explain;

my $re = qr!^\d*((\.)?\d{1,5}|)!;

print YAPE::Regex::Explain->new( $re )->explain();
