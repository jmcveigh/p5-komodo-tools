#!/usr/bin/perl

my $string = "I have. In my string.Replace all but last one.";

@parts = split(/(?<=\.)\s*/, $string);

print "$_\n" for @parts;

__END__

./split.pl
I have.
In my string.
Replace all but last one.
_
