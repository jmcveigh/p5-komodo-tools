#!/usr/bin/perl
use strict;
use warnings;

my $count = 0;

while (my $line = <DATA>){
    if ($line =~ /count="(\d+)"/) {
        $count = $1;
        next;
    }
    if ($count){
        print $line;
        $count--;
    }
}
__DATA__
count="2"
a
b
c
d
count="1":
e
f
g
count="3"
h
i
j
k
l
