package Oneliners::Controller::Root;
use Moose;
use Oneliners::Form::Oneliner;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub oneliners_form {
    my ($self, $c) = @_;    
    my $form = Oneliners::Form::Oneliner->new;    
    my $oneliners = $c->model('Oneliners')->new;
    
    $oneliners->items([]);
    
    $oneliners->deserialize;
    
    $c->stash(template => 'index.ttkt.html', form => $form, items => $oneliners->items);
    $form->process(params => $c->req->params );
    return unless $form->validated();
    
    my $oneliner = $c->model('Oneliner')->new($c->req->params);
    
    push @{$oneliners->items}, $oneliner;

    $oneliners->serialize;
    
    $c->response->redirect($c->uri_for($self->action_for('posted')));
}

sub posted :Local :Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'posted.ttkt.html');
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
        
    $self->oneliners_form($c);
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
