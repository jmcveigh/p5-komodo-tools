#!/usr/bin/perl

use warnings;
use strict;
use 5.12.0;

use Data::Dumper;

open my $with, '<', "with_office.txt"
    or die "Can't open the with doc: $!";

open my $without, '<', "without_office.txt"
    or die "Can't open the without doc: $!";

my %computers_with_office;

while ( my $line = <$with> ){
   
    my ( $name, $version ) = split( /;/, $line );
    $name = lc $name;
    push @{ $computers_with_office{ $name } }, $version;
}

open my $new_file, '>', "new.txt"
    or die "Can't open the output file: $!";

print $new_file "\n\n\n\n\n\n"; # so it is easier to delim upon cat

while ( my $line = <$without> ){

    chomp $line;

    my $pc_name = lc ( ( split( /;/, $line ) )[0] );

    $line .= ";";

    my $offices;

    for my $entry ( @{ $computers_with_office{ $pc_name } } ){
       
        chomp $entry;
        $line .= "$entry;";
    }

    print $new_file "$line\n";
}
