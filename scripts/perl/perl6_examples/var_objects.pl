#!/home/steve/perl6/perl6

my @a = 2, 3, 1;

# number of elements

my $x = @a.elems;
my $y = @a;

say $x;
say $y;

say 'blah' if @a < 5;

# doesn't work

say @a;

# other built in methods

say @a.sort;
say @a.map({ $_ + 10 });

# or even

say @a.sort.map({ $_ + 10 });


my %h = z => 26, b => 5, c => 2, a => 9;
say %h.keys;
say %h.values;
say %h.keys.sort;
