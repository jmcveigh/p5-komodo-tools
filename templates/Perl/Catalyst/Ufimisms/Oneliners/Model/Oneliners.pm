package Oneliners::Model::Oneliners;
use Moose;
use Oneliners::Model::Oneliner;
use namespace::autoclean;

extends 'Catalyst::Model';

has 'items' => (
    is => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
);

sub serialize {
    my ($self) = (shift);
    
    my $oneliner;
    
    my $path = './root/data/oneliners.dat';
    
    my @lines;
    
    while (my $oneliner = shift @{$self->items}) {
        my ($username, $line) = ($oneliner->line, $oneliner->username);
        if ($username && $line) {
            chomp $username;
            chomp $line;
            push @lines, $username;
            push @lines, $line;
        } else {
            last;
        }
    }
    
    unlink $path;
    
    open(OL, "> $path") or die "Couldn't open $path for writing: $!\n";
    print OL join("\n",@lines) . "\n";
    close(OL);
}

sub deserialize {
    my ($self) = (shift);
    
    my $path = './root/data/oneliners.dat';
    
    open(OL, "< $path") or die "Couldn't open $path for reading: $!\n";    
    my @lines = <OL>;
    close(OL);
    
    for my $i (1 .. 10) {
        my ($username, $line) = (pop @lines, pop @lines);
        chomp $username;
        chomp $line;
        if ($username && $line) {
            unshift @{$self->items}, Oneliners::Model::Oneliner->new({line => $line, username => $username});
        } else {
            last;
        }
    }
}

__PACKAGE__->meta->make_immutable;

1;
