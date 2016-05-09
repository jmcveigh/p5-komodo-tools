#!/usr/bin/perl

# code by 'rightfold' on StackOverflow
# 2015-06-24

use warnings;
use strict;

use Data::Dumper;

my %hash = (
      'BlackBerryOS' => {
                          '6.0' => 9201,
                          '7' => 5896,
                          '10' => 9140,
                          '4.1' => 5395,
                          '4.6' => 6536
                        },
      'iOS' => {
                 '8' => 9327,
                 '3.0' => 4112,
                 '5.0' => 8579,
                 '4.0' => 14953,
                 '6.0' => 12007,
                 '7.0' => 13162
               },
      'AndroidOS' => {
                       '4.2' => 167501,
                       '2.3.4' => 7889,
                       'x' => 473602,
                       '4.3' => 44551,
                       '4.1.2' => 90984
                     }
    );


my @data;
for my $os (keys %hash) {
    for my $version (keys %{$hash{$os}}) {
        push @data, { os => $os, version => $version, n => $hash{$os}->{$version} };
    }
}


@data = sort { $b->{n} <=> $a->{n} } @data;


for (@data) {
    print "$_->{os}\t$_->{version}\t$_->{n}\n";
}

print Dumper \@data;
