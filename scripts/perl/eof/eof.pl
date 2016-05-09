#!/usr/bin/perl -w
use strict ;
use warnings;

my $tofind = '20110223232323';
my $log = 'fil.log' ;
open (my $log_fh,'<', $log) or die "can't open errorlog.txt\n" ;         

my $found = 0;

while (my $line =<$log_fh>) {
	chomp ($line);       

	if ($found) {
		print "$line\n";
		next;
	}
	if ($line =~ /$tofind/) {  
		$found = 1;
	}
}
close $log_fh;
