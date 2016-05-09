#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

my %data;

while ( <DATA> ){

	my @cols = split;

	if ( $cols[2] eq 'hyper' ) {
		push @{ $data{$cols[0]} }, $cols[3];
	}
}

for my $key ( keys %data ){
	say "$key: ";
	foreach my $element ( @{ $data{$key} } ){
		say "	$element";
	}
}	

__DATA__
alligator-n    amphibian_reptile    event    sleep-v
alligator-n    amphibian_reptile    event    swim-v
alligator-n    amphibian_reptile    event    walk-v
alligator-n    amphibian_reptile    hyper    animal-n
alligator-n    amphibian_reptile    hyper    beast-n
alligator-n    amphibian_reptile    hyper    carnivore-n
alligator-n    amphibian_reptile    mero     foot-n
alligator-n    amphibian_reptile    mero     jaw-n
