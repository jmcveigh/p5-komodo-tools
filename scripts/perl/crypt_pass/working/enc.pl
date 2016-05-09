#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

print "\nCreate a password: ";
chomp ( my $password = <STDIN> );

my $salt = 'j4';
my $crypt_pass = crypt( $salt, $password );

print "Enter your message to be encrypted: ";
chomp ( my $message = <STDIN> );

my @hex_pass 
  = map { sprintf( "%x", ( ord( $_ ))) } split //, $crypt_pass;
my @hex_msg  
  = map { sprintf( "%x", ( ord( $_ ))) } split //, $message; 

my @crypted;

my @hash;
push @hash, @hex_pass until @hash > @hex_msg;

my $i=0;
for my $letter ( @hex_msg ){
    push @crypted, hex( $letter ) + hex( $hash[$i] );
    $i++;
}

@crypted  = map { sprintf( "%x", $_ ) } @crypted;

print "\nYour encrypted message: ";
print @crypted;
print "\n\n";
