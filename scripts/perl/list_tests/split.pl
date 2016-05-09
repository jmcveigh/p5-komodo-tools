#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my $string = "one two three four five";

my $x ( split / /, $string )[3];
