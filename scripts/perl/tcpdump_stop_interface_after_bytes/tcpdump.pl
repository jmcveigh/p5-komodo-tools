#!/usr/bin/perl
use warnings;
use strict;

my $file = 'tcpdump.pcap';
my $int = 'wlan0';
my $bytes = 1000000;

my $pid = open my $pipe, 
  "| /usr/sbin/tcpdump -n -i $int -s 0 -w $file &",
  or die $!;

print "$pid\n";

sleep 3;

while (-s $file < $bytes){

    if (-s $file > $bytes){
        print "Killing PID $pid and tcpdump\n";
        system "kill -9 $pid; killall tcpdump";
        system "/sbin/ifconfig $int down";
    }
}


