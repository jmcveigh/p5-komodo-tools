#!/usr/bin/perl
use strict;
use warnings;


fibonacci(5);

sub fibonacci {
    my $n = $_[0];

    if ($n < 2) {
        return 1;
    } 
    else {
        
        fibonacci($n - 1) + fibonacci($n = 2);
    }
}

