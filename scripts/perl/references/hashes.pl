#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

# define an hash and print its
# contents

my %hash = ( a => 1, b => 2, c => 3 );

while ( my ( $key, $value ) = each %hash ){

    say "key: $key, value: $value";
}

my $href = \%hash;

while ( my ( $key, $value ) = each %{ $href } ){

    say "key: $key, value: $value";
}

my $x = $hash{ a };

my $y = $href->{ a };

$hash{ a }  = "assigning to hash key a";

$href->{ a } = "assigning to hash key a";


