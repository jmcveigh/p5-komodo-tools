#!/usr/bin/perl
use warnings;
use strict;

sub warning {
    print "ERROR!!!\n";
}

my $out;
open my $stdout, '>', \$out
  or die $!;

{
    local *STDOUT = $stdout;
    warning();
}
