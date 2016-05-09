#!/usr/bin/perl 

use warnings;
use strict;

print "what is your name: ";
chomp( my $name = <STDIN> );
print "hello $name\n";

print "select letter\n";
chomp( my $select = <STDIN> );

if ($select eq 'a'){
    print "good choice\n";
}
else {
    print "bad choice\n";
}
