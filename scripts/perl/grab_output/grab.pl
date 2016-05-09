#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

open my $fh, '<', 'data.txt' or die $!;

$/ = "\n--\n";
while ( defined(my $line = <$fh>) ){
    print "$line***\n\n";
    say $1 if $line =~ /\b0x014E\b/ and $line =~ /^(Output: .+)/m;
}
__END__

my $begin = 0;

while ( my $line = <$fh> ){

    chomp $line;
    $begin = 1 if $line =~ /0x014E/;
    next unless $begin;

    say $line and last if $line =~ /^Output:/;
}  
