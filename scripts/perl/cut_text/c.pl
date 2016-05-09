#!/usr/bin/perl 

use strict;
use warnings;
use 5.12.0;

use YAPE::Regex::Explain;

my $record = <<EOF;

Say this is a page from a book. 

There are multiple ways to do this, but this 
is only one. Say we want to go from here
taking this text that goes all the way
to here, we could do this...

EOF

# get everything between 'from here' and
# 'to here' with a very simple regex.

my $regex = qr/from here(.*?)to here/ms;

$record =~ /$regex/;

say $1 if $1;

print YAPE::Regex::Explain->new( $regex )->explain();
