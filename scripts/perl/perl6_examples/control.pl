#!/home/steve/perl6/perl6

my $x = 5;

if $x < 10 {
    say "it's less";
}

my @a = 'a'..'z';

for @a -> $elem {
    say $elem;
}

#for my $elem ( @a ){
#    say $elem;
#}

my %h = a => 1, b => 2, c => 3;

for %h.kv -> $k, $v {
    say "$k :: $v"
}

for @a -> $f, $s, $t {
    say "$f, $s, $t I took two elems!";
}
