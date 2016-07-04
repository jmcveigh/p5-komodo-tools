use common::sense;

package Command {
    use common::sense;

    use MooseX::App::Simple qw(Color);

    use Term::ProgressBar::Simple;
    
    use feature 'say';
    
    option 'argument-1' => (
        is => 'rw',
        isa => 'Str',
        required => 1,
        documentation => 'This is argument 1.',
    );
    
    sub run {
        my ($self) = @_;
        say "Argument 1 is set to " . $self->{'argument-1'};
    }        
}

my $cmd = Command->new_with_options->run unless caller;

1;