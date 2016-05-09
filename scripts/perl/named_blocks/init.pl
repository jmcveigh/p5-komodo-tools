#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

persist();

 BEGIN{
    my $store = init_store();
    sub persist {
        say $store++;
    }
}

sub init_store { 0; }

persist();
persist();

