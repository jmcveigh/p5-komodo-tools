#!/usr/bin/perl

use warnings;
use strict;

my $pid;

# to test the eval/child kill block, set $time
# to a higher number than $alarm

my $time	= $ARGV[0] || 2;
my $alarm 	= $ARGV[1] || 3;

# fork a child. $pid of 0 identifies the parent

if ( $pid = fork() ){
	print "\nproc ID $pid forked, I'm the parent\n";
}
else {
	print "I'm proc ID $pid, the child\n";
}

# this is the parent

if ( $pid != 0 ){
	print "Parent is waiting...\n";

	# waitpid() will stop here and wait for the child
	# even when the child has more code below. After 
	# the child exit()s, the next line of code in this
	# if() block will proceed

	eval {
		$SIG{ALRM} = sub { die(); };
		alarm $alarm;
		waitpid( $pid, 0 );
		print "\nSuccessful run, parent now exiting.\n\n";
		exit();
	};
	if ( $@ ){
		kill( 9, $pid );
		print "\nParent killed child for taking too long, and is now exiting.\n\n";
	}
}

# back to the child again, if he isn't dead yet :)

if ( $pid == 0 ){

	# rest for $time seconds for testing
	# the alarm
	
	print "I'm the child, working\n";
	sleep( $time );
	print "Child is now done, and is exiting.\n";
	exit();
}
