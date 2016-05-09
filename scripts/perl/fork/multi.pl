#!/usr/bin/perl

use warnings; use strict;

my %email = (
            ken =>
                {
                    name => 'Ken May',
                    addr => 'kenm@hello.com',
                },
            suzie =>
                {
                    name => 'Suzie Sheer',
                    addr => 'ss@hello.com',
                },
            steve =>
                {
                    name => 'Stevie B',
                    addr => 'sb@hello.com',
                }

);

my @children;

for my $key (keys( %email )){
    my $pid = fork();

    if( $pid ){
        print "PID $pid forked: $key\n";
        push @children, $pid;
    }
    else {
        my $proc = start($key);
        exit($proc);
    }
}

for my $child (@children){
    my $pid = waitpid($child, 0);
    print "PID $pid exited...\n";
}

sub start {
    my $key = shift;
    print "$key Starting...\n";
    print "$email{$key}->{'addr'}, $email{$key}->{'name'}\n";
    sleep(5);
    print "$key Ending...\n";
}





