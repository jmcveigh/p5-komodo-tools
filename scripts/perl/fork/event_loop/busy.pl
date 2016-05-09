#!/usr/bin/perl

use warnings;
use strict;

my $lock_file = 'lock.lck';

open my $lock, '>', $lock_file
  or die "Can't grab a lock file: $!";

print "$0: Starting subtask...\n";

sleep(5);

print "$0: Ending subtask...\n";

close $lock;
unlink $lock_file;
 
