#!/bin/perl -w

{
    package Application;

    use Moose;
    use Mail::Mailer;

    use feature 'say';
    use feature 'state';

    use namespace::autoclean;

    sub main {
        my $mailer = Mail::Mailer->new('smtp', Server => 'localhost:1025');
        $mailer->open( {
            From => 'jmcveigh@echoplex.office.local',
            To => 'jmcveigh@echoplex.office.local',
            Subject => 'Hello, World!',
        }) or die "Can't open; $!\n";
        print "sending mail...\n";
        print $mailer "Hello, World!";
        $mailer->close();
    }

    state $_instance //= Application->new();

    sub get_instance {
        return($_instance);
    }

    __PACKAGE__->meta->make_immutable;
}

my $app = Application->get_instance;
$app->main;