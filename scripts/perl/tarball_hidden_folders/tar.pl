#!/usr/bin/perl

use warnings;
use strict;

my $dir = 'test';
system ('tar', '-zcvf', 'my_tarball.tgz', $dir);
