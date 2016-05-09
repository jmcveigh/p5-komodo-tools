#!/usr/bin/perl
use strict;
use warnings;

use Symbol qw(delete_package);

my @pre_require = keys %INC;

print "Modules pre-require: " . @pre_require . "\n";

sub unuse {
    eval "require $_[0]";
    eval "import $_[0]";
}

unuse('Devel::Examine::Subs');

my $des = Devel::Examine::Subs->new(file => 'one');

my @post_require = keys %INC;

print "Modules post-require: " . @post_require . "\n";

my $count = @post_require - @pre_require;

print "Additional modules loaded: $count\n";

for my $file (@post_require){

    if (! grep /$file/, @pre_require){

        (my $module = $file ) =~ s/\//::/g;
        $module =~ s/\.pm$//;

        delete_package $module;

        delete $INC{$file};
    }
}

my @post_cleanup = keys %INC;

print "Module count post cleanup: " . @post_cleanup . "\n";
