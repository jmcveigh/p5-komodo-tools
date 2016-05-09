#!/usr/bin/perl

use warnings;
use strict;
use List::Util qw( first );

my @rules = 
(
    {
        name => 'name1',
        re => qr/regex1/,
        color => 'yellow',
    },
    {
        name => 'name2',
        re => qr/regex2/,
        color => 'green',
    },
    {
        name => 'default',
        re => qr/.*/,
        color => '',
    },
);

my $class = 'regex1';

#my $color = ( first { $class =~ /$_->{'re'}/ } @rules )->{ color };                
my $color = ${  first { $class =~ /$_->{'re'}/ } @rules  }{ color };                

print "$color\n";

