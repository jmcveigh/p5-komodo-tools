package MemberSite::Controller::Entrance;
use Moose;
use MemberSite::Form::Entrance;
use MemberSite::Form::Reminder;
use Storable qw(dclone);
use Mail::Mailer;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MemberSite::Controller::Entrance - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    $self->form($c);
}

sub form {
    my ($self, $c) = @_;    
    my $form = MemberSite::Form::Entrance->new;
    $c->stash(template => 'entrance/index.tt', form => $form);
    $form->process(params => $c->req->params);
    return unless $form->validated();        
    my $values = dclone($c->req->params);
    delete($values->{submit});

    if ($values->{username} and $values->{password}) {
        if ($c->authenticate({ username => $values->{username}, password => $values->{password}})) {
            $c->response->redirect($c->uri_for($c->controller('Members')->action_for('index')));
            return;
        } else {
            $c->stash(error_msg => 'The username and password are invalid.');
        }
    } else {
        $c->stash(error_msg => 'Enter both username and password.');
    }
    
    $c->stash(template => 'entrance/index.tt');
}

sub reminder :Local :Args(0) {
    my ($self, $c) = @_;
    my $form = MemberSite::Form::Reminder->new;
    $c->stash(template => 'entrance/reminder.tt', form => $form);
    $form->process(params => $c->req->params);
    return unless $form->validated();        

    my $member = $c->model('DB::Member')->single({email => $c->req->param('email')});
    if (defined($member)) {
        my ($given_name, $username, $password) = ($member->given_name, $member->username, $member->password);
        # send reminder email message
        my $mailer = Mail::Mailer->new('smtp', Server => 'localhost:1025');
        $mailer->open( {
            From => 'jmcveigh@echoplex.office.local',
            To => $member->email,
            Subject => 'Reminder.  This is a reminder email for MemberSite.',
        });    

        print $mailer <<"VALIDATION_MSG";
    Hello, $given_name!
    
    This is a username and password reminder for MemberSite.
    
    The username associated with this email is : $username.
    The password associated with this email is : $password.
    
VALIDATION_MSG
        $mailer->close();
        $c->stash(success_msg => 'An email containing the username and password has been sent to the specified address.');
    }
    
    $c->stash(template => 'entrance/reminder.tt');
}

=encoding utf8

=head1 AUTHOR

Jason McVeigh

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;