#!/usr/bin/perl
use warnings;
use strict;

use Test::More;
use Test::Exception;
use Carp;

sub use_system {
    system("asdfasdf asdfasdf");
    croak('this error') if $?;
}

{
    open my $stderr, '>', 'temp.fil' or die $!;
    local *STDERR = $stderr;

    dies_ok {use_system()} 'Died :(';

    # or even

    eval { use_system(); };

    like ($@, qr/this error/, "function failed with 'this error'");


}

warn "STDERR back to normal\n";

