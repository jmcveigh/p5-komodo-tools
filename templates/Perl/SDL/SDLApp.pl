use common::sense;

package Statelike {
    use Moose::Role;
    
    requires qw(draw_frame);
}

package State_Black {    
    use Moose;
    with 'Statelike';
    
    use common::sense;
    
    use namespace::autoclean;

    has '_bg' => (
        is => 'ro',
        isa => 'SDL::Rect',
        builder => '_build_bg',
    );
    
    has '_bg_colour' => (
        is => 'ro',
        isa => 'SDL::Color',
        builder => '_build_bg_colour',
    );
    
    sub _build_app {
        return(SDLx::App->new(width => 640,height => 480,depth => 32,title => 'My SDL Program'));
    }
    
    sub _build_bg {
        return(SDL::Rect->new(0,0,640,480));
    }
    
    sub _build_bg_colour {
        return(SDL::Color->new(0,0,0));
    }
    
    sub draw_frame {
        my $self = shift;
        my $app = shift, shift;
        
        SDL::Video::fill_rect($app, $self->_bg, $self->_bg_colour);        
    };
    
    __PACKAGE__->meta->make_immutable;
}

package StateContext {
    use Moose;
    
    use common::sense;
    
    use namespace::autoclean;
    
    has '_state' => (
        is => 'rw',
        isa => 'Statelike',
        builder => '_build_state',
    );
    
    sub _build_state {
        return(State_Black->new);
    }
    
    sub set_state {
        my $self = shift;
        my $new_state = shift;
        $self->_state($new_state);
        
        return 1;
    }
    
    sub draw_frame {
        my $self = shift;
        my $app = shift;
        
        $self->_state->draw_frame($self, $app);
    }
    
    __PACKAGE__->meta->make_immutable;
}

package Application {
    use Moose;
    
    use common::sense;
    
    use SDL;
    use SDLx::App;
    use SDL::Event;
    use SDL::Events;
    use namespace::autoclean;
   
    has 'app' => (
        is => 'ro',
        isa => 'SDLx::App',
        builder => '_build_app',
    );
    
    has '_context' => (
        is => 'ro',
        isa => 'StateContext',
        builder => '_build_context',
    );
    
    sub _build_context {
        return(StateContext->new);
    }
        
    sub _build_app {
        return(SDLx::App->new(width => 640,height => 480,depth => 32,title => 'My SDL Program'));
    }    
    
    sub main {
        my $self = shift;
        die "Error: could not start SDL application" if not defined($self->app);
        $self->_context->draw_frame($self->app);
    }
    
    __PACKAGE__->meta->make_immutable;
}

my $app = Application->new->main unless caller;

1;