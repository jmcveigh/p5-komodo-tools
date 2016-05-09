#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my @a = ( 1, 2, 3 );

my $aref = \@a;

my @b = hello( $aref );

say "Original array:";
for my $x ( @a ){
    print "$x ";
}

say "\nReturned copy:";
for my $y ( @b ){
    print "$y ";
}

sub hello {

    my $aref = shift;
    
    # make a copy of the referenced array
    my @array = @{ $aref };

    $array[ 0 ] = 99;

    return @array;
}

goodbye( 1, undef, 3 );

sub goodbye {
    my $a = shift;
    my $b = shift;
    my $c = shift;
}
my %data = (
            user => 'stevieb',
            year => 2012,            
        );

my $data_ref = \%data;

car( $data_ref );

sub car {
    my $p = shift;

    my $user = $p->{ user };
    my $year = $p->{ year };

    say "Our luser of $p->{ year } is $p->{ user }";
}

sub user_of_the_year ( {
                        name    => 'stevieb',
                        year    => 2012,
                        score   => 199,
                        awards  => 3,
                    });
