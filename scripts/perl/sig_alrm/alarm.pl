#!/usr/bin/perl

use warnings;
use strict;

some_sub();
some_sub();

sub some_sub {
  eval {
    local $SIG{ALRM} = sub {die "died in SIG ALRM";};

    alarm(1);

    my $i=0;
    $i++ while 1;

    alarm(0);
  };
  if ($@) {
    if ($@ =~ /died in SIG ALRM/) {
      print "caught\n";
    }
    else {
      print $@;
    }
  }
}
