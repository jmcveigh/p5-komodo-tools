#!/usr/bin/perl
use warnings;
use strict;

use DateTime::Format::Strptime;

my $log = 'git.log';

my %dates;
my @order;

open my $fh, '<', $log or die $!;

while (<$fh>){

    if (/Date:\s+(.*?)(\d{2}:.*)/){
        push @order, $1 if ! $dates{$1};
        push @{ $dates{$1} }, "$1$2";
    }
}

my $letter = 'A';
my $total_time = DateTime::Duration->new;

for my $day (@order){

    my $start = $dates{$day}->[0];
    my $end = $dates{$day}->[-1];

    my $parser = DateTime::Format::Strptime->new(
        pattern => '%a %b %d %H:%M:%S %Y %z',
        on_error => 'croak',
    );

    my $dt1 = $parser->parse_datetime($start);
    my $dt2 = $parser->parse_datetime($end);

    my $total = $dt1 - $dt2;
    $total_time = $total_time + $total;

    print "$start\n$end\n";

    print "Total $letter:\t";
    print join ':', ($total->hours, $total->minutes, $total->seconds);
    print "\n\n";

    $letter++;
}

print "Total time overall: ";
print join ':', ($total_time->hours, $total_time->minutes, $total_time->seconds);
print "\n";
