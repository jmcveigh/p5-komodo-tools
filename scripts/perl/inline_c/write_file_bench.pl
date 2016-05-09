#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use Benchmark qw(:all);
use File::Copy;
use File::Edit::Portable qw(recsep);
use Inline 'C';

my $fname = 'a.txt';
my $ftemp = 'temp.txt';
my $copy = '';
my $frs = recsep($fname);
my $rs = "\r\n";

cmpthese( 1, {
    pwrite => "pwrite('$fname', '$ftemp', '$copy', '$frs', '$rs')",
    cwrite => "cwrite('$fname', '$ftemp', '$copy', '$frs', '$rs')",
});

#cwrite($fname, $ftemp, $copy, $frs, $rs);
#pwrite($fname, $ftemp, $copy, $frs, $rs);

sub pwrite {
    my ($fname, $ftemp, $copy, $frs, $rs) = @_;

    open my $fh, '<', $fname or die $!;
    open my $wfh, '>', $ftemp or die $!;

    while (<$fh>){
        s/$frs/$rs/;
        print $wfh $_;
    }
    close $fh;
    close $wfh;

    if ($copy){
        copy $fname, $copy;
    }
}

__END__
__C__

#include <stdio.h>
#include <string.h>

void cwrite(char *fname, char *ftemp, char *copy, char *frs, char *rs){

    FILE *fh;
    FILE *wfh;
    char buf[1024];

    fh = fopen(fname, "r");
    wfh = fopen(ftemp, "w");

    if (! fh){
        printf("Couldn't open file %s for reading.\n", fname);
        return 0;
    }
    if (! wfh){
        printf("Couldn't open file %s for writing.\n", ftemp);
        return 0;
    }

    while (fgets(buf, sizeof(buf), fh)){
        buf[strcspn(buf, frs)] = '\0';
        strcat(buf, rs);
        fprintf(wfh, "%s", buf);
    }

    fclose(fh);
    fclose(wfh);

    if (copy[0] != '\0'){
        if (! rename(ftemp, copy) == 0){
            fprintf(stderr, "error copying to %s\n", copy);
        }
    }
}
