#!/usr/bin/perl

use warnings;
use strict;

use Parallel::ForkManager;

my $max_forks = 10;

my $fork = new Parallel::ForkManager($max_forks);

# forking code


for my $client (1..33){

    $fork->start and next;

    do_something($client);

    $fork->finish;

}

sub do_something {
    my $client = shift;
    my $x = qx/echo $client/;
    print "$client :: $x\n";
}

$fork->wait_all_children;

