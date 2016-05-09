#!/usr/bin/perl

use warnings;
use strict;

use File::Find;

my $path;

if ( $ARGV[0] ){
    $path = $ARGV[0];
}
else {
    print "Enter path: ";
    chomp (my $path = <STDIN> );
}

find( \&wanted, $path );

sub wanted {
    print "File: $_\n" if -f;
    print "Dir:  $_\n" if -d;
}
