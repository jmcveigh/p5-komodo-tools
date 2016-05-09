#!/usr/bin/perl
use warnings;
use strict;

use feature 'postderef';
no warnings 'experimental::postderef';

use Benchmark qw(cmpthese timethese);

my $count = 100000;

cmpthese(1000, {
        'circumfix' => \&circumfix,
        'postderef' => \&postderef,
        'no_braces' => \&no_braces,
});

sub circumfix {
    my ($h, $a, @a);
   
    for (1..$count){
        push @{$h->{$_}}, [$_];
    }
    for my $k (keys %{$h}){
        for (@{$h->{$k}}){
            push @{$a}, $_ for @{$_};
        }
    }
    push @a, $_ for @{$a};
}

sub postderef {
    my ($h, $a, @a);
   
    for (1..$count){
        push $h->{$_}->@*, [$_];
    }
    for my $k (keys $h->%*){
        for ($h->{$k}->@*){
            push $a->@*, $_ for $_->@*;
        }
    }
    push @a, $_ for $a->@*;
}

sub no_braces {
    my ($h, $a, @a);
   
    for (1..$count){
        push @{$h->{$_}}, [$_];
    }
    for my $k (keys %$h){
        for (@{$h->{$k}}){
            push @$a, $_ for @$_;
        }
    }
    push @a, $_ for @$a;
}


