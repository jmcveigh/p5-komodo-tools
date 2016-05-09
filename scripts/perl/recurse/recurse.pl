#!/usr/bin/perl

use strict;
use warnings;

my $attributes =
[
  { type => 'colors',  values => [qw/red green blue/]  },
  { type => 'sizes',   values => [qw/small large/] },
  { type => 'shades',  values => [qw/light dark/] },
  { type => 'when',	   values => [qw/now then/] },
];

sub combo {
  my @traits = @_;

  # nothing given, nothing returned
  return if @traits == 0;

  # return the last list
  if( @traits == 1 ){
    return map { [ $_ ] } @{ $traits[0]{values} };
  }

  # get the combos for everything but the first one
  my @combos = combo( @traits[ 1 .. $#traits ] );

  # now combine them
  my @result = ();
  for my $first ( @{ $traits[0]{values} } ){
    for my $rest ( @combos ){
      push @result, [ $first, @$rest ];
    }
  }

  return @result;
}

my @list = combo( @$attributes );

for my $set ( @list ){
  print "@$set\n";
}

