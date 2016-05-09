#!/usr/bin/perl

my @a=qw(1 2 3);
my @b=qw(a b c);

while( (my $i,$e) = each @a){
    $a[$i] = $b[$i];
}

print @a;
