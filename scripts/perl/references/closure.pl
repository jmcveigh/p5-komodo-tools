#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my %h;
for my $color ( qw(red green blue) ){
    $h{$color} = sub { say $color };
}

$h{ blue }->();
$h{ red }->();
$h{ green }->();
