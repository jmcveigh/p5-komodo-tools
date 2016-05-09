#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

fib( 5, 0 );

my $count = 0;
my $sub_1_count = 0;
my $sub_2_count = 0;

sub  fib  { 

    my  $num            = shift; 
    my  $recurse_sub    = shift;

    $count++;

    print "\nEntering main\n";
    print "Iteration: $count\n";
    print "Call: sub($recurse_sub)\n";
    print "Working num: $num\n";

    my ( $x, $y );

    if  ($num <= 2) {  

        print "Returning 1 called by fib($recurse_sub)\n";
        return 1;
    } 
    else { 

        given ( $recurse_sub ){
             
            when ( /-1/ ){
                $sub_1_count++;
                print "Entering fib($recurse_sub), call $sub_1_count\n";
                $x = fib($num-1, -1);  
            }
            when( /-2/ ){
                $sub_2_count++;
                print "Entering fib($recurse_sub), call $sub_2_count\n";
                $y = fib($num-2, -2); 
            }
        }
        print "Returning fib(-1) + fib(-2)\n";
        print "Result: $x $y\n";

        return $x + $y; 
     } 
 } 
