#!/usr/bin/perl 

use warnings;
use strict;

my $cmd = "top";
my $time = '10';
my $check = 5 ;
print "check was-$check-\n\n\n";
eval {
        local $SIG{ALRM} = sub { die "times up" };
        alarm ($time);
        $check = system ( $cmd )  ;
        alarm (0) ;
};
if ( $@ ) {
        chomp ( $@ ) ;
        print "yuck-$@-\n" ;
}
else {
        print "ok\n";
}

print "\n\ncheck now-$check\n";
