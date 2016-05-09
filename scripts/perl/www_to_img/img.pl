#!/usr/bin/perl
use strict;
use warnings;

use WWW::Mechanize::Firefox;

my $mech = WWW::Mechanize::Firefox->new();

open my $urls, '<', 'urls.txt' or die $!;

while (my $url = <$urls>) {
    chomp;
    next unless /^http/i;
    print "$url\n";
    $mech->get($url);
    my $png = $mech->content_as_png;
    my $name = $url;
    $name =~ s#^http://##i;
    $name =~ s#/##g;
    $name =~ s/\s+\z//;
    $name =~ s/\A\s+//;
    $name =~ s/^www\.//;
    $name .= ".png";
    #binmode $out;
    open my $out, '>', "images/$name" or die $!;
    print $out $png;
    sleep 5;
}
