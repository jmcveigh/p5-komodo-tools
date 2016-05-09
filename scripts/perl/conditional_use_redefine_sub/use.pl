#!/usr/bin/perl
package One;

use warnings;
use strict;

use Data::Dumper;

use lib '.';

BEGIN {
    eval 
    {
        require Thing;
        import Thing qw(test);
    };

    if ($@){
#    if (! defined &Thing::test){
            *test = sub { print "redef\n"; };
#    }
    }
};
test();

print Dumper \%One::;

