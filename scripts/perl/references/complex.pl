#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

use Data::Dumper;

my @a;
my @a_0 = ( 1, 2, 3 );
my @a_1 = ( 4, 5, 6 );
my @a_2 = ( 7, 8, 9 );

$a[0] = \@a_0;
$a[1] = \@a_1;
$a[2] = \@a_2;

#say $a[0]->[0];

my $x = 0;

for my $aref ( @a ){

    #say "in top level of a, elem $x";
    $x++;

    my $y = 0;

    for my $aref_elem ( @{ $aref } ){

        #say "in second level elem $y, elem is: $aref_elem";
        $y++;
    }
}

my %person;

my %clothes  = ( shirt => 'red', pants => 'black', );
my %schedule = ( work => '0800', home => '0500', sleep => '2300', );
my %skills   = ( programming => 'ok', social => 'great', learning => 'excellent' );

$person{ clothes  } = \%clothes;
$person{ schedule } = \%schedule;
$person{ skills }   = \%skills;

# get the person's shirt

my $shirt_colour = $person{ clothes }->{ shirt }; # red

# change the person's shirt

$person{ clothes }{ shirt } = 'black';

####  insert bit about no ->

# list the persons skills

print "Person has the following skills: ";

for my $skill ( keys %{ $person{ skills } } ){
    print "$skill ";
}
print "\n";

# list each skill with the ability to perform the skill

print "Person's ";

while ( my ( $skill, $ability ) = each %{ $person{ skills } } ){

    print "$skill is $ability\n";
}





