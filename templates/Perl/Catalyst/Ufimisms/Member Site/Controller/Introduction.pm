package MemberSite::Controller::Introduction;
use Moose;
use MemberSite::Form::Introduction;
use Storable qw(dclone);
use Digest::MD5 qw(md5_base64);
use Mail::Mailer;
use URI::Encode qw(uri_encode uri_decode);
use Template;
use namespace::autoclean;
use constant EMAIL_TITLE_VALIDATION => 'Welcome.  This is a welcome email for MemberSite.';
BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    $self->form($c);
}

sub success :Local :Path('success') {
    my ($self, $c) = @_;
    $c->stash(template => 'introduction/success.ttkt.html');
}

sub validation :Local {
    my ($self, $c) = @_;
    
    my $validation_digest = uri_decode($c->request->param('v'));
    
    my $member = $c->model('DB::Member')->single({validation_digest => $validation_digest});
    if (defined($member)) {
        $member->validated(1);
        $member->update;
        $c->stash(template => 'introduction/success.ttkt.html');
    } else {
        $c->response->body('Invalid request.');
    }
}

sub form {
    my ($self, $c) = @_;
    my $form = MemberSite::Form::Introduction->new;
    $c->stash(template => 'introduction/index.ttkt.html', form => $form);
    $form->process(params => $c->req->params );
    return unless $form->validated();

    my $values = dclone($c->req->params);
    delete($values->{submit});
    delete($values->{repeat_password});
    
    my $validation_context = new Digest::MD5->new;    
    $validation_context->add([$values->{username}, $values->{email}]);
    $values->{validation_digest} = uri_encode($validation_context->b64digest);
        
    # add member record to database
    my $member = $c->model('DB::Member')->new_result($values);
    $member->insert;
    
    # send welcome email message
    my $mailer = Mail::Mailer->new('smtp', Server => 'localhost:1025');
    $mailer->open( {
        From => 'jmcveigh@echoplex.office.local',
        To => $values->{email},
        Subject => EMAIL_TITLE_VALIDATION,
    });    

    my $ttkt = Template->new;
    my $ttkt_output = '';

    $ttkt->process('root/mail/validation.ttkt.html',{
        given_name => $values->{given_name},
        surname => $values->{surname},
        email => $values->{email},
        validation_digest => $values->{validation_digest},
    },\$ttkt_output);

    print $mailer $ttkt_output;

    $mailer->close();
    
    $c->response->redirect($c->uri_for($self->action_for('success')));
}

__PACKAGE__->meta->make_immutable;

1;