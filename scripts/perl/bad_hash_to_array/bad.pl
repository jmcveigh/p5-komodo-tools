#!/usr/bin/perl

use Tk;
use strict;
use warnings;

my $mw=new MainWindow;
my @header = ("FHT_neg45","FHT_0","FHT_45","FHT_90","OHT_neg45","OHT_0","OHT_45","OHT_90");
my $button = $mw->Button(-text=>"temp",
	-command=> \&button)->pack();
MainLoop;

sub button {
	#Read BJSFM_out.prn into an array @data
	my $filename="BJSFM_out.prn";
	open my $fh, '<', $filename or die "Can't find allowables.txt! $!";
	my $string="Laminate Strain Allowables";

    my @data=<$fh>;
    my $n = 0;    
    for (@data) {
        chomp;
        if ($_ eq $string) {
            $data[$n] = $header[$n];
            $n++;
        }
    }
	open my $write_fh, '<', 'temp.txt';
	print $write_fh @data;
	close $write_fh;
}
