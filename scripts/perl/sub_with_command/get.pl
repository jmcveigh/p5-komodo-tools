#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my $search_term = 'ipconfig';
my %subs;
my $name;

while ( my $line = <DATA> ){
    if ( $line =~ /^sub\s+/ ){
        $name = (split /\s+/, $line)[1];
        $subs{ $name } = 0;
        next;
    }
    $subs{ $name } = 1 if $line =~ /$search_term/;
}

while ( my ($k,$v) = each %subs ){
    # print subs that call $search_term
    say "sub $k calls $search_term" if $v;
}
__DATA__

sub one {
    #one
    #two
    #three
    #ipconfig
    #four
}
sub two {
    #hello
    #there
    #wonderful
    #world
}
sub three {
    #ifconfig
    #ipconfig
    #nmap -sS -P0 localhost
    #tcpdump -n -i re0 -s 0 -w a.file

