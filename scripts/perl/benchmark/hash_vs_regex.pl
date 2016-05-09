#!/usr/bin/perl

use warnings;
use strict;

use Benchmark qw(:all);

cmpthese ( 5000000, {
                'string' => 'string()',
                'hash' => 'hash()',
            });

sub string {
    my $str = "1689 9679 2792 2514 5472 1520 9342 5544 1268 0165 1979 7314 2101 7221 9539 3882 1812";
    my $test = 2101;
    if ($str =~ $test){
        # do stuff
    }
}
sub hash {
    my $str = "1689 9679 2792 2514 5472 1520 9342 5544 1268 0165 1979 7314 2101 7221 9539 3882 1812";
    my $test = 2101;
    my %hash;
    for (split /\s+/, $str){
        $hash{$_}++;
    }
    if (exists $hash{$test}){
        # do stuff
    }
}
