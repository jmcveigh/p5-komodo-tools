#!/home/steve/perl6/perl6

my @a = 'a', 'b', 'c';
my %h;

for @a.kv -> $index, $elem {
    %h{ $index } = $elem;
}


