#!/usr/bin/perl
use warnings;
use strict;

use Benchmark qw(:all);
use Inline 'C';

my $f_a = 'a.txt';
my $f_b = 'b.txt';

#cmpthese( 100000, {
#        p_replace => "p_replace('$f_a')",
#        c_replace => "c_replace('$f_a')",
#});

timethese( 1, {
        p_replace => "p_replace('$f_b')",
        c_replace => "c_replace('$f_b')",
});

sub modify_from_c {
    my $line = shift;
#    $line =~ s/0/5/;
    return $line;
}    
sub p_replace {
    my $fname = shift;
    open my $fh, '<', $fname or die $!;
    while (<$fh>){
        s/0/5/;
    }
    close $fh;
}

__END__
__C__

#include <stdio.h>
int c_replace(char* fname){

    FILE *fh;
    fh = fopen(fname, "r");

    if (! fh){
        printf("Couldn't open file %s for reading.\n", fname);
        return 0;
    }

    char line[256];

    while (fgets(line, sizeof(line), fh)){

        dSP;
        ENTER;
        SAVETMPS;

        PUSHMARK(SP);
        XPUSHs(sv_2mortal(newSVpv(line, strlen(line))));
        PUTBACK;

        int return_count = call_pv("modify_from_c", G_SCALAR);

        if (return_count > 1){
            croak("invalid return count from modify_from_c()\n");
        }

        SPAGAIN;

        char* modified_line = POPp;

        //printf("c orig: %sc new: %s", line, modified_line);

        PUTBACK;
        FREETMPS;
        LEAVE;
    }

    fclose(fh);
}
