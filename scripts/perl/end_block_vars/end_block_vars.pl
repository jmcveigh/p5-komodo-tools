#!/usr/bin/perl

use warnings;
use strict;

use POSIX qw (tmpnam);
use Fcntl;
use IO::File;

my $f_name;
my $fh;

do { $f_name = tmpnam() } 
  until $fh = IO::File->new($f_name, O_RDWR | O_CREAT | O_EXCL );

print "$f_name\n";
print $fh "$_\n" while $_++ < 10;

seek( $fh, 0, 0 );

print "$_" while  <$fh>;

print "No\n" if ( ! -e "foobar.txt" );
print "Yes\n" if -e $f_name;

END { unlink $f_name; print "No\n" if (! -e $f_name ); }
