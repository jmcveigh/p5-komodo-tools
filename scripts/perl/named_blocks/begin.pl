#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

persist();
{
    my $store = 0;
    sub persist {
        print $store++ . " ";
    }
}
persist();
persist();
persist();

