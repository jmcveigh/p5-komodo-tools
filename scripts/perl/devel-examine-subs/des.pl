#!/usr/bin/perl
use warnings;
use strict;
use 5.18.0;

use Devel::Examine::Subs;
use File::Find;

my $des = Devel::Examine::Subs->new();

my $dir = 'business-isp/';
my @searches = qw(template this that other);

for my $search (@searches){
    
    say "\n***** SEARCHING FOR: $search *****\n";
    
    find({ wanted => sub { check_subs($search) }, no_chdir => 1 }, 
           $dir
    );
}

sub check_subs {
   
    my $search = shift;

    if (! -f or ! /(?:\.pm|\.pl)$/){
        return;
    } 
    
    my $file = "$File::Find::name";
    
    my @has = $des->has({file => $file, search => $search});

    return if ! @has;

    say "\n$file:" ;
    say "\t$_" for @has;
}
