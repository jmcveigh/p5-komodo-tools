#!/usr/bin/perl

use warnings;
use strict;

{
package This;

sub new {
    my $class = shift;
    my $self = bless ({}, $class);
    return $self;
}
}

my $this = This->new();
