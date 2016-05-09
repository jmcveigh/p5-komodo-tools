#!/usr/bin/perl

print "Enter a string to encrypt with DES:n";
chomp($string = <STDIN>); #Take the input from user for the password

print "And now enter your message that you want to encrypt:";
chomp($mess = <STDIN>);# takes imput from user for the message

$salt = "j4"; #declars a salt

my $crypt_string = crypt($string,$salt); #using crypt, turns user password into a hash

$testchars = $crypt_string;
#$hexchars = '';
foreach my $c (split(//,$testchars)) { #I wish i knew exactly how this works, i know its splitting the original string and turning each digit to hex
$hexchars .= sprintf "%x", ord($c); #the hash in hexidec
}
print "$hexchars\n";#not needed just shows me whats working how, remove later

my $testchars2 = $mess;
#my $hexchars2 = '';
foreach my $d (split(//,$testchars2)) {#I wish i knew exactly how this works, i know its splitting the original string and turning each digit to hex
$hexchars2 .= sprintf "%x", ord($d); #the user message in hexidec
}
print "$hexchars2\n";#not needed just shows me whats working how, remove later

@hash = split //, $hexchars; #takes the hexed hash and splits it, saving each digit into an array
print "hash: $hash[0] $hash[1] $hash[2] $hash[3] \n "; #not needed just shows me whats working how, remove later

@hexmess = split //, $hexchars2; #takes the hexed message and splits it, saving each digit into an array
print "hexmess: $hexmess[0] $hexmess[1] $hexmess[2] $hexmess[3] $hexmess[4]\n";
