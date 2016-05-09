#!/usr/bin/perl
use warnings;
use strict;

package One;

    sub new {
        my $self = bless {}, shift;
        return $self;
    }
    sub callback {
        return sub {my $x = shift; return $x+10;};
    }

package Two;

    sub new {
        my $self = bless {}, shift;
        return $self;
    }
    sub get_callback {
        my $one = One->new();
        my $callback = $one->callback();
    }

package main;

my $two = Two->new();
my $x = $two->get_callback();

my $y = $x->(10);

print "$y\n";
