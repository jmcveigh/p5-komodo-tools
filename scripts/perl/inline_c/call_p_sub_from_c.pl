#!/usr/bin/perl
use warnings;
use strict;

use Inline 'C';

sub p_func {
    print $_ for @_; 
}

c_func("hello, world!\n");

__END__
__C__

void c_func(SV* text){
    dSP;

    ENTER;
    SAVETMPS;

    XPUSHs(sv_2mortal(newSVpvf("c call\n")));
    PUTBACK;

    call_pv("p_func", G_DISCARD);

    FREETMPS;
    LEAVE;
}
