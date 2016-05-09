#!/usr/bin/perl

use warnings;
use strict;

my $lock_file = 'lock.lck';

print "$0: Calling subtask script...\n";

system("/usr/bin/perl busy.pl &");

my $start = 0;

while(1){
    sleep(2) if ! $start;
    $start++;

    if (-e $lock_file){
        print "$0: Subtask still running...\n";
        sleep(1);
        next;
    }
    print "$0: Done!\n";
    exit;
}
