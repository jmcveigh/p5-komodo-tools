#!/bin/perl
use strict;
use warnings;

print 'Materializing ...';

print <<`EOC`; # execute commands
unzip ../../materialize-v0.97.5.zip -d ./root/static;
mv ./root/static/materialize/css ./root/static/;
mv ./root/static/materialize/font ./root/static/;
mv ./root/static/materialize/js ./root/static/;
rm ./root/static/materialize/LICENSE;
rm ./root/static/materialize/README.md;
rmdir ./root/static/materialize/;
cp ../../jquery-1.12.0.min.js ./root/static/js;
EOC
print 'Complete!\n';
