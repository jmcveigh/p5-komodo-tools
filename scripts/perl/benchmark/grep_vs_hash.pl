#!/usr/bin/perl

use warnings;
use strict;

use Benchmark qw(:all);
use Data::Dumper;

my $str = "1689 9679 2792 2514 5472 1520 9342 5544 1268 0165 1979 7314 2101 7221 9539 3882 1812";
my $array = [qw(1689 9679 2792 2514 5472 1520 9342 5544 1268 0165 1979 7314 2101 7221 9539 3882 1812)];

my $hash;
for (split /\s+/, $str){
    $hash->{$_}++;
}

sub array {
    my ($array, $test) = @_;
    if (grep /$test/, @$array){
        print "a";
    }
}
sub hash {
    my ($hash, $t) = @_;
    if (exists $hash->{$t}){
        print "h";
    }
}
cmpthese ( 500000000, {
                'array' => 'array($array, 2101)',
                'hash' => 'hash($hash, 2101)',
            });

