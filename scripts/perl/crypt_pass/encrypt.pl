#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;


my $salt = 'j4';

my ( $password, $message ) = input( $salt );
my ( $hex_pass, $hex_msg ) = hexify( $password, $message );

my @encrypted_message      = encrypt( $hex_pass, $hex_msg );

output( @encrypted_message );

sub input {
   
    my $salt = shift;

    print "\nEnter password: ";
    chomp ( my $password = <STDIN> );
    $password = _crypt( $salt, $password );

    print "Enter your message to be encrypted: ";
    chomp ( my $message = <STDIN> );

    return ( $password, $message );
}
sub _crypt {

    my ( $salt, $password ) = @_;
    my $crypt_pass = crypt( $salt, $password );
    
    return $crypt_pass;
}
sub hexify {

    my ( $password, $message ) = @_;

    my @pass = split //, $password;
    my @msg  = split //, $message;

    my @hex_pass = map { sprintf( "%x", ( ord( $_ ) ) ) } @pass;
    my @hex_msg  = map { sprintf( "%x", ( ord( $_ ) ) ) } @msg;

    return ( \@hex_pass, \@hex_msg );
}
sub _create_key {

    my ( $hex_pass, $hex_msg ) = @_;

    my @hash;
    push @hash, @{ $hex_pass } until @hash > @{ $hex_msg };

    return @hash;
}
sub encrypt {
   
    my ( $hex_pass, $hex_msg ) = @_;

    my @hash_key = _create_key( $hex_pass, $hex_msg );

    my @crypted;

    my $i=0;
    for my $letter ( @{ $hex_msg } ){
        push @crypted, hex( $letter ) + hex( $hash_key[$i] );
        $i++;
    }

    @crypted  = map { sprintf( "%x", $_ ) } @crypted;

    return @crypted;
}
sub output {

    my @encrypted_message = @_;

    print "\nYour encrypted message: ";
    print @encrypted_message;
    print "\n\n";
}

