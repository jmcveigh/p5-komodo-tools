#!/usr/bin/perl

use warnings;
use strict;

my $h = {'i1' => {'i2' => {'i3' => [534, 10, 99]}}};

sub deref {

    my $param = shift;

    for my $k (keys(%$param)){
        if (ref($param->{$k}) eq 'HASH'){
            print "$param->{$k}\n";

            # call this sub again with the next level of the hash
            # as a parameter, if it's another hashref

            deref($param->{$k});
        }
        elsif (ref($param->{$k}) eq 'ARRAY'){
            print "$_\n" for @{ $param->{$k} };
        }
    }
}

deref($h);
