#!/usr/bin/perl

use warnings;
use strict;

use Proc::PID::File;

my $pid = Proc::PID::File->new();
if ($pid->running()) {
    die "Already running";
} 
