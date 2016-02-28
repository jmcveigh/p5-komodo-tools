#!/bin/perl
use strict;
use warnings;

print 'Materializing ...';

if (-r "../../assets/kitty-punk-framework-4.0.zip") {
print <<`EOC`; # execute commands
unzip ../../assets/kitty-punk-framework-4.0.zip -d ./root/static;
EOC
print 'Complete!\n';
} else {
    print "ERROR: Assets folder not found!";
}

