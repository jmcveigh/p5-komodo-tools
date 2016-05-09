#!/usr/bin/perl

use warnings;
use strict;

open my $fh, '+>', 'file.log' or die "Can't open file\n";

print "Doing work\n";

other_work();

# write that we've finished
write();

sub other_work {
    print "Doing other work\n";
    die() if 1; #fatal error!
}
sub write {
    my $fh = shift;
    print $fh "Program run at " . time() . "\n";
}
END{
    open my $fh, '+>', 'file.log' or die "Can't open file\n";
    print $fh "Program failed at " . time() . "\n";
}
