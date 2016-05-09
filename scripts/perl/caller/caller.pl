#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

this();

sub this {
    that();
}
sub that {
    my $sub = ( caller( 0 ) )[3];
    say $sub;
}
