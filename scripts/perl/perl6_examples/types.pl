#!/home/steve/perl6/perl6


say (1,2,3).WHAT;
say 25.WHAT;
say 'string'.WHAT;

my $quote = "I am liking Perl6";
if $quote ~~ Str {
    say "it's a string";
}

my Int $x = 5;

$x = "Hello, world!";
