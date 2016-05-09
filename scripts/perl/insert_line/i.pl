#!/usr/bin/perl

use warnings;
use strict;

open my $f_in,  '<',  'f.txt' or die "Can't open file: $!";

my @file_data = <$f_in>;

my $count = 1;
my @output;

for my $line ( @file_data ){
    push @output, "foo\n" if $count == 3;
    push @output, $line;
}
close $f_in;

open my $f_out, '>',  'f.new' or die "Can't open file: $!";

for my 

__END__

while ( my $line = <$f_in> ){
    if ($. == 3) { 
        print $f_out "foo\n";
    }
    print $f_out $line; 
}
