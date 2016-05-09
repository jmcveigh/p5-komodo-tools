#!/usr/bin/perl

use warnings;
use strict;

my %dt = (
        'sit down'    => sub { print "\nYou pull up a chair to sit your lazy butt on\n\n" },
        'throw rock'  => sub { print "\nYou just broke the damned window!\n\n" },
        'have drinks' => sub { print "\nWow, you're gonna be hungover tomorrow!\n\n" },
        'suicide'     => sub { print "\nGame over!\n\n"; exit; },
    );

while ( 1 ){

    print "\nPlease type an action from this list: ";
    print join( ', ', keys %dt );
    print "\nYour selection: ";
    chomp( my $action = <STDIN> );

    if (! defined $dt{ $action } ){
        print "\nThat is an invalid action!\n\n";
        next;
    }
    $dt{ $action }->();
}
