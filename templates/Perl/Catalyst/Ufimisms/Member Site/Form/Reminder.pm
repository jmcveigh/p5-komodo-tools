package MemberSite::Form::Reminder;
use HTML::FormHandler::Moose;
use MemberSite::Model::DB;

extends 'HTML::FormHandler';

has '+item_class' => ( default => 'Reminder::Item' );

has_field 'email' => (
	type => 'Email',
    wrapper_class => ['form-group'],
    element_class => ['form-control'],
	required => 1,
);

sub validate {
    my $self = shift;
    my $schema = MemberSite::Model::DB->new;
    $schema->connect;
    my $member = $schema->resultset('Member')->single({email => $self->field('email')->value});
    
    unless (defined($member) && $member->validated) {
        $self->field('email')->add_error('This account is inactive at this time.');
    }
}

has_field 'submit' => (
	type => 'Submit',
	value => 'Submit',
    wrapper_class => ['form-group'],
	element_attr => {
		class => ['row', 'btn', 'btn-default', 'pull-right'],
	},
    tags => { 
		wrapper_tag => 'div',        
	},
);

1;