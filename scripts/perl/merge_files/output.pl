#!/usr/bin/perl

use warnings;
use strict;

my %entries;

open my $src_file, '<', "src.fil" or die "Can't open src.fil!: $!";

# grab the ids from the source file

while ( my $line = <$src_file> ){
	chomp $line;
	$entries{ $line } = '';
}
close $src_file;

open my $sec_file, '<', "sec.fil" or die "Can't open sec.fil!: $!";

# compare the ids to the second file, and grab
# the lines that match

while ( my $line = <$sec_file> ){

	chomp $line;

	my $id = (split( ':', $line))[1];
	
	if ( exists $entries{ $id } ){
			$entries{ $id } = $line;
	}
}
close $sec_file;

for my $key (keys %entries){
	print "$key: $entries{ $key }\n";
}
