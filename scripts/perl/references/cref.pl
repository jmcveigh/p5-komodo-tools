#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

{
sub hello {
    say "Hello, world!";
}

my $cref = \&hello;

#$cref->();
}

sub persist {

    my $count = 0;

    return sub { $count++; }
}

{
my $count_a_cref = persist();
my $count_b_cref = persist();
my $count_c_cref = persist();

say "Count A: " . $count_a_cref->();
say "Count A: " . $count_a_cref->();
say "Count B: " . $count_b_cref->();
say "Count B: " . $count_b_cref->();
say "Count B: " . $count_b_cref->();
say "Count C: " . $count_c_cref->();
}

{

sub write_line {

    my $count = 0;

    return sub { return ++$count; }
}

my $steve_lines = write_line();
my $dave_lines  = write_line();
my $sarah_lines = write_line();

# steve writes three lines of code

my $steve_total;
$steve_total = $steve_lines->();
$steve_total = $steve_lines->();
$steve_total = $steve_lines->();

# dave writes one

my $dave_total;
$dave_total = $dave_lines->();

# sarah writes two

my $sarah_total;
$sarah_total = $sarah_lines->();
$sarah_total = $sarah_lines->();

say "Steve wrote $steve_total lines of code";
say "Dave wrote $dave_total lines of code";
say "Sarah wrote $sarah_total lines of code";

}

