#!/usr/bin/perl

use warnings;
use strict;

use Parallel::ForkManager;

my $max_forks = 2;

my $fork = new Parallel::ForkManager($max_forks);

my @urls = (
             'http://perlmonks.org', 
             'http://stackoverflow.com',
             'http://slashdot.org', 
             'http://wired.com',
);

# on start callback

$fork->run_on_start(
    sub {
            my $pid = shift;
            print "Starting PID $pid\n";
    }
);

# on finish callback

$fork->run_on_finish(
    sub {
        my ($pid, $exit, $ident, $signal, $core) = @_;
        if ($core){
            print "PID $pid core dumped.\n";
        }
        else {
            print "PID $pid exited with exit code $exit " .
                  " and signal $signal\n";
        }
    }
);

# forking code

for my $url (@urls){

    $fork->start and next;

    ### add curl logic here
    print "$url\n\n";
    sleep(2);


    $fork->finish;

}

$fork->wait_all_children;
