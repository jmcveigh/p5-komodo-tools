package MemberSite::Form::Entrance;
use HTML::FormHandler::Moose;
use MemberSite::Model::DB;

extends 'HTML::FormHandler';

has '+item_class' => ( default => 'Entrance::Item' );

has_field 'username' => (
	type => 'Text',
    wrapper_class => ['input-field','col','s12'],    
    minlength => 4,
    maxlength => 18,
	required => 1,
);

has_field 'password' => (
	type => 'Password',
    wrapper_class => ['input-field','col','s6'],
	required => 1,
);

sub validate {
    my $self = shift;
    my $schema = MemberSite::Model::DB->new;
    $schema->connect;
    my $member = $schema->resultset('Member')->single({username => $self->field('username')->value});
    
    unless (defined($member) && $member->validated && $member->active) {
        $self->field('username')->add_error('This account is inactive at this time.');
    }
}

has_field 'submit' => (
	type => 'Submit',
	value => 'Enter',
	element_attr => {
		class => ['input-field','btn','waves-effect','waves-light','right'],
		style => 'color: black;',
	},
    tags => { 
		wrapper_tag => 'div',
        label_tag => 'label',
	},
    wrapper_class => ['input-field','col','s2','offset-s10'],
);

1;