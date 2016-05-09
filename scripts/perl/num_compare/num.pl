#!/usr/bin/perl 

use strict;
use warnings;

my ($datecompare,$line,$id) ;
use POSIX qw(strftime);  
my $tstrmodif ;  
my ($sec,$min,$hr,$mday,$mon,) = localtime ;
my $yesterday = strftime "%Y%m%d", localtime(time - 24 * 60 * 60 * 1);
$tstrmodif = "$yesterday$hr$min$sec" ;
print "Yesterday = $tstrmodif\n";
   
my $tempvt = 'tempvt.txt' ;
open (my $tempvt_fh,'<',$tempvt) or die"Can't open tempvt.txt" ; 
while ($line = <$tempvt_fh>){         
    ($datecompare,$id) = split /\s/, $line ;
    if ($datecompare > $tstrmodif)  {
        print "$line" ;
        next;
    }
}          
