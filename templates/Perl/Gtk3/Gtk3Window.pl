use common::sense;

my $doc1;

package MyDocument {
    use Moose;

    use common::sense;
    
    use feature 'say';
    use feature 'state';
    use feature 'switch';

    use Gtk3 -init;
    
    use namespace::autoclean;

    has 'mw' => (
        is => 'ro',
        isa => 'Gtk3::Window',
        default => sub { my $mw = Gtk3::Window->new ('toplevel') or die 'Regrettably, there was an incident with the width and height as it has not yet been defined as 2 whole integer values in between 240 and 8192'; return ($mw); },
    );

    has '_f1' => (
        is => 'ro',
        isa => 'Gtk3::Frame',        
        lazy => 1,
        default => sub { my $f1 = Gtk3::Frame->new ('Primary'); $self->mw->add($f1); return($f1); },
    );

    # Order of Operations
    sub _ooo {
        my $i;
        ($_) = @_;

        $_->_f1;
    }

    sub main {
        my $i;
        ($_) = @_;

        MainLoop;
    }

    __PACKAGE__->meta->make_immutable;
}


$doc1 = MyDocument->new;
$doc1->_ooo;
$doc1->main unless caller;

1;