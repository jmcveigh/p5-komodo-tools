#!/usr/bin/perl

use warnings;
use strict;

use Benchmark qw(:all);

cmpthese ( 5000000, {
                'copy'  => 'my @args = qw(a b c); copy(@args)',
                'shift' => 'my @args = qw(a b c); shift_off(@args);',
                'for'  => 'my @args = qw(a b c); shift_for(@args);',
           });


sub shift_off {
    my $x = shift;
    my $y = shift;
    my $z = shift;
}
sub copy {
    my ( $x, $y, $z ) = @_;
}
sub shift_for {
    my ( $x, $y, $z ) = $_ for shift @_;
}
