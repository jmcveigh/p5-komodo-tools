#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my @game_array;

while ( my $link = <DATA> ){

    # char classes around '.' actually escapes it
    # when used in a regex

    push @game_array, $link =~ m/onclick="document\.location\.href='(.+?)'"/g;
}

say $_ for @game_array;

__DATA__
onclick="document.location.href='hello'"onclick="document.location.href='there'"onclick="document.location.href='world'"
