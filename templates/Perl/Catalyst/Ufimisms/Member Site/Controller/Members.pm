package MemberSite::Controller::Members;
use Moose;
use MemberSite::Utils;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MemberSite::Controller::Members - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub auto :Private {
    my ($self, $c) = @_;
    
    if ($c->controller eq $c->controller('Entrance')) {
        return 1;
    }
    
    if (!$c->user_exists) {
        $c->log->debug('*** Members::auto User not found, forwarding to /entrance');
        $c->response->redirect($c->uri_for('/entrance'));        
        return 0;
    }
    
    return 1;    
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'members/index.tt');
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