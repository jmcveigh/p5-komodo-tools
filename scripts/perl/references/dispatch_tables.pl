#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my %dt = (
            hello    => sub { say "Hello, world!"; },
            add      => \&add,
        );


# call the functions

my $more = $dt{ add }->( 5, 5 );
$dt{ hello }->();


sub add {

    my $x = shift;
    my $y = shift;
    return ( $x + $y );
}

