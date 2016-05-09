#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my %dt = (
    
            add      => \&add,
            subtract => \&subtract,
            multiply => \&multiply,
            divide   => \&divide,
            'exit'   => sub { say "\nGoodbye!\n"; exit; },
        );
    

while (1) {

    system( "clear" );
    
    print "Please enter either add, subtract, multiply, divide or exit: ";
    chomp ( my $operation = <STDIN> );

    # exit if told to

    $dt{ exit }->() if $operation eq 'exit';

    # exit if illegal param

    if ( ! exists $dt{ $operation } ){
        say "\nIllegal input... exiting\n";
        exit;
    }
    
    print "Type in your first number: ";
    chomp ( my $x = <STDIN> );

    print "Type in your second number: ";
    chomp ( my $y = <STDIN> );

    # run the command selected by the user

    my $result = $dt{ $operation }->( $x, $y );

    say "\nPerforming $operation on $x and $y = $result\n";

    print "\nPress ENTER to continue...\n";
    <STDIN>;
    
}
sub add {
    my ( $x, $y ) = @_;
    return $x + $y;
}
sub subtract {
    my ( $x, $y ) = @_;
    return $x - $y;
}
sub multiply {
    my ( $x, $y ) = @_;
    return $x * $y;
}
sub divide {
    my ( $x, $y ) = @_;
    return $x / $y;
}
