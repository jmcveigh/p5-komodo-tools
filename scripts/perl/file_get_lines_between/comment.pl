#!/usr/bin/perl
use warnings;
use strict;

my $comment = 0;

while (my $line = <DATA>){

    if ($line =~ m#/\*#){
        $comment = 1;
        next;
    }
   
    if ($line =~ m#\*/#){
        $comment = 0;
        next;
    }

    next if $comment;

    print $line;

}

__DATA__
this
that
/* comment line 1
comment line 2
comment line 3
*/
the other
adsf
