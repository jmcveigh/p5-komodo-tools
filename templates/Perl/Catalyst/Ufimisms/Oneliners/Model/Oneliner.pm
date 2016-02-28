package Oneliners::Model::Oneliner;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

has 'line' => (
    is => 'rw',
    isa => 'Str',
    builder => '_build_empty_string',
);

has 'username' => (
    is => 'rw',
    isa => 'Str',
    builder => '_build_empty_string',
);

sub _build_empty_string {
    my ($self) = (shift);
    
    return("");
}

__PACKAGE__->meta->make_immutable;

1;
