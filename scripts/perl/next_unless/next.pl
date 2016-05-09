#!/usr/bin/perl

use warnings;
use strict;

my @names = qw( steve );
my $name  = 'steve';

while ( 1 ){
    next unless ( grep( /$name/, @names ));
    print "$name isnt in the array so continue";
}
