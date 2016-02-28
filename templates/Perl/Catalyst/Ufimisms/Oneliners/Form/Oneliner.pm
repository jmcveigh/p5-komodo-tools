package Oneliners::Form::Oneliner;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

has '+item_class' => ( default => 'Oneliner::Item' );

has_field 'line' => (
	type => 'Text',
    wrapper_class => ['input-field','','col-sm-8'],
	required => 1,
);

has_field 'username' => (
	type => 'Text',	
    wrapper_class => ['input-field','','col-sm-2'],    
	required => 1,
);

has_field 'submit' => (
	type => 'Submit',
	value => 'Post!',
	element_attr => {
		class => ['btn','waves-effect','waves-light'],
	},
    wrapper_class => ['input-field','','col-sm-2'],
);

1;