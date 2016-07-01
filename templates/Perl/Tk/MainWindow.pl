use common::sense;

my $doc1;

package MyDocument {
    use Moose;

    use feature 'say';
    use feature 'state';
    use feature 'switch';

    use Tk;
    use Tk::Canvas;

    use namespace::autoclean;

    has 'mw' => (
        is => 'ro',
        isa => 'Tk::MainWindow',
        default => sub { my $mw = Tk::MainWindow->new or die 'Regrettably, there was an incident with the width and height as it has not yet been defined as 2 whole integer values in between 240 and 8192'; $mw->geometry("${ARGV[0]}x${ARGV[1]}"); return ($mw); },
    );

    has '_cn_background' => (
        is => 'ro',
        isa => 'Tk::Canvas',
        lazy => 1,
        default => sub { $doc1->mw->Canvas->pack(-expand => 1, -fill => 'both') },
    );

    has '_f1' => (
        is => 'ro',
        isa => 'Tk::Frame',        
        lazy => 1,
        default => sub { $doc1->_cn_background->Frame(-background => 'aliceblue')->pack(-expand => 1, -fill => 'both') },
    );

    # Order of Operations
    sub _ooo {
        my $i;
        ($_) = @_;

        $_->_cn_background;
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