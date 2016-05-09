#!/usr/bin/perl
use warnings;
use strict;

use Inline 'C';

c_replace('a.txt');

sub modify_from_c {
    my $line = shift;
    $line =~ s/0/5/;
    return $line;
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
        XPUSHs(sv_2mortal(newSVpv(line, 0)));
        PUTBACK;

        int return_count = call_pv("modify_from_c", G_SCALAR);

        if (return_count > 1){
            croak("invalid return count from modify_from_c()\n");
        }

        SPAGAIN;

        char* modified_line = POPp;

        printf("c orig: %sc new: %s", line, modified_line);

        PUTBACK;
        FREETMPS;
        LEAVE;
    }

    fclose(fh);
}
