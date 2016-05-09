#!/usr/bin/perl
use warnings;
use strict;

# Thanks to 'Your Mother' over at PerlMonks for this!!

use PPI;

my $doc = PPI::Document->new('lib/Devel/Examine/Subs.pm');

my $subs = $doc->find("PPI::Statement::Sub");
for my $sub ( @$subs )
{
    my $start = $sub->line_number;
    my $lines = $sub =~ y/\n//;
    my $end = $start + $lines;
    my $name = $sub->name;
    print "Found $name starting at line ", $start,
        " and ending at line ", $end, $/;
}
