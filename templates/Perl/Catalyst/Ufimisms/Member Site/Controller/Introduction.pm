package MemberSite::Controller::Introduction;
use Moose;
use MemberSite::Form::Introduction;
use Storable qw(dclone);
use Digest::MD5 qw(md5_base64);
use Mail::Mailer;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MemberSite::Controller::Introduction - Catalyst Controller

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

sub success :Local :Path('success') {
    my ($self, $c) = @_;
    $c->stash(template => 'introduction/success.tt');
}

sub validation :Local {
    my ($self, $c) = @_;
    
    my $validation_digest = $c->request->param('v');
    
    my $member = $c->model('DB::Member')->single({validation_digest => $validation_digest});
    if (defined($member)) {
        $member->validated(1);
        $member->update;
        $c->stash(template => 'introduction/success.tt');        
    } else {
        $c->response->body('Invalid request.');
    }
}

sub form {
    my ($self, $c) = @_;    
    my $form = MemberSite::Form::Introduction->new;
    $c->stash(template => 'introduction/index.tt', form => $form);
    $form->process(params => $c->req->params );
    return unless $form->validated();
        
    my $values = dclone($c->req->params);
    delete($values->{submit});
    delete($values->{repeat_password});
    
    my $validation_context = new Digest::MD5->new;    
    $validation_context->add([$values->{username}, $values->{email}]);
    $values->{validation_digest} = $validation_context->b64digest;
        
    # add member record to database
    my $member = $c->model('DB::Member')->new_result($values);
    $member->insert;
    
    # send welcome email message
    my $mailer = Mail::Mailer->new('smtp', Server => 'localhost:1025');
    $mailer->open( {
        From => 'jmcveigh@echoplex.office.local',
        To => $values->{email},
        Subject => 'Welcome.  This is a welcome email for MemberSite.',
    });    

    print $mailer <<"VALIDATION_MSG";
    Hello, $values->{given_name}!
    
    This is a Welcome email message for MemberSite.
    
    Please click on the following URL to validate this email address :
    
    <a href="0.0.0.0:3000/introduction/validation?v=$values->{validation_digest}">0.0.0.0:3000/introduction/validation?v=$values->{validation_digest}</a>
VALIDATION_MSG

    $mailer->close();
    
    $c->response->redirect($c->uri_for($self->action_for('success')));
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