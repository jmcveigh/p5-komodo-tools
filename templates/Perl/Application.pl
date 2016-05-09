#!/bin/perl -w

package Application {
    use Moose;

    use feature 'say';
    use feature 'state';
    use feature 'switch';

    use namespace::autoclean;

    sub main {
        my ($self) = @_;
        say "Hello, world!  I am a Perl application.";
    }

    __PACKAGE__->meta->make_immutable;
}

my $app = Application->new->main unless caller;

1;