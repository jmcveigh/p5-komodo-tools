#!/bin/perl
use strict;
use warnings;
use feature 'say';

say 'Materializing ...';

print <<`EOC`; # execute commands
unzip ../../Downloads/materialize-v0.97.5.zip -d ./root/static
mv ./root/static/materialize/css ./root/static/
mv ./root/static/materialize/font ./root/static/
mv ./root/static/materialize/js ./root/static/
rm ./root/static/materialize/LICENSE
rm ./root/static/materialize/README.md
rmdir ./root/static/materialize/
cp ../../Downloads/jquery-1.*.min.js ./root/static/js
EOC

say 'Success!';
