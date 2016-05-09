#!/usr/bin/perl

use strict;
use warnings;

my $attributes = [
  { type => 'colors',  values => [qw/red green blue/]  },
  { type => 'sizes',   values => [qw/small large/] },
  { type => 'shades',  values => [qw/light dark/] },
  { type => 'place',   values => [qw/Toronto Montreal/] },
  { type => 'temp',    values => [qw/cold hot warm/] },
];

print "$_\n" foreach combos(map $_->{values}, @$attributes);

sub combos {

  my $first = shift;

  return @$first unless @_;

  my @combinations;

  foreach my $beg (@$first) {
    foreach my $end (combos(@_)) {
      push @combinations, "$beg $end";
    }
  }

  return @combinations;
} 
