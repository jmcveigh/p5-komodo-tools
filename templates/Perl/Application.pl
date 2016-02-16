#!%(perl) -w
use feature 'say';

{
    package Application;
    use Moose;
    use namespace::autoclean;
    
    our $_instance = Application->new();
    sub get_instance {
        return($_instance);
    }
    
    sub go {
        say "Hello, world!  I am a Perl application.";
    }
    
    __PACKAGE__->meta->make_immutable;
}

my $app = Application->get_instance;
$app->go;