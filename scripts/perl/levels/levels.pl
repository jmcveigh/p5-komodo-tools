#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;

my $attributes =
[
  { type => 'colors',  values => [qw/red green blue/]  },
  { type => 'sizes',   values => [qw/small large/] },
  { type => 'shades',  values => [qw/light dark/] },
];

#AoHoA

my @combos = ();


my $item; #aref
my $count = 0;
my $elem;

build( 4 );

sub build {

	my $depth = shift;

	foreach my $value ( @{ $attributes->[$count]{ values } }  ){
		push @$item, $value;
		print "$value\n";
	}
	
	if ( $count == $#$attributes ) {
		$elem = 0;
	}
	$count++;
	$elem++;

	build( $elem );	
#	if ( @$attrs ){	
#		build( $attrs );
#}
}

#print join( ' ', @$item );

#foreach my $a (@{$attributes->[0]->{values}}) {
#  foreach my $b (@{$attributes->[1]->{values}}) {
#    foreach my $c (@{$attributes->[2]->{values}}) {
#      push @combos, [$a, $b, $c];
#    }
#  }
#}

#print Dumper \@combos;
