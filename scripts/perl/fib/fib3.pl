#!/usr/bin/perl

use warnings;
use strict;

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

    if  ($num <= 2) {  

        print "Returning 1 called by fib($recurse_sub)\n";
        return 1;
    } 
     else   { 

         $sub_1_count++;
         print "Entering fib($recurse_sub), call $sub_1_count\n";
         my $x = fib($num-1, -1);  
         
         $sub_2_count++;
         print "Entering fib($recurse_sub), call $sub_2_count\n";
         my $y = fib($num-2, -2); 

         print "Returning fib(-1) + fib(-2)\n";
         print "Result: $x $y\n";

         return $x + $y; 
      } 
} 
