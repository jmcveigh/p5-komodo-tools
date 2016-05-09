#!/usr/bin/env perl

use warnings;
use strict;

use File::Find;

my $dir;

if ($^O eq 'MSWin32'){
    $dir = "c:\\users\\sbertrand";
}
else {
    $dir = "/home/steve02/devel/repos";
}

find({ wanted => \&do_file, no_chdir => 1 }, $dir);

sub do_file {
    my $file = $File::Find::name;

    if (! -f $file){
        return;
    }
    print "$file\n";
}

