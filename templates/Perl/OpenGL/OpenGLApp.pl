#/bin/perl

package AppStatelike {
    use Moose::Role;

    requires qw(event_loop);
}

package AppState_Active {
    use Moose;
    use SDL;
    use SDLx::App;
    use SDL::Event;
    use SDL::Mouse;
    use SDL::Video;
    use SDL::Events qw(:all);
    use OpenGL qw(:all);

    with 'AppStatelike';

    use feature 'state';

    use constant GAMEBOARD_WIDTH => 640;
    use constant GAMEBOARD_HEIGHT => 480;

    use namespace::autoclean;

    sub _init_gl {
        my $self = shift;

        glViewport(0,0,GAMEBOARD_WIDTH,GAMEBOARD_HEIGHT);

    	glMatrixMode(GL_PROJECTION);
        glLoadIdentity();

        gluPerspective(45.0,GAMEBOARD_WIDTH / GAMEBOARD_HEIGHT,0.1,100.0);

    	glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glShadeModel(GL_SMOOTH);
        glClearColor(0.09, 0.13, 0.15, 0.0);
    	glClearDepth(1.0);
        glEnable(GL_DEPTH_TEST);
    	glDepthFunc(GL_LEQUAL);
        glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    }

    sub _draw_frame {
        my $self = shift;
        my $app = shift, shift;
        state ($rotation_triangle,$rotation_quad) //= (0,0);

    	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    	glLoadIdentity();
    	glTranslatef(-1.5,0.0,-6.0);
    	glBegin(GL_TRIANGLES);
            glColor3f(0.43, 0.54, 0.59);
    		glVertex3f( 0.0, 1.0, 0.0);
    		glVertex3f(-1.0,-1.0, 0.0);
    		glVertex3f( 1.0,-1.0, 0.0);
    	glEnd();
        glTranslatef(3.0,0.0,0.0);
    	glBegin(GL_QUADS);
            glColor3f(0.38, 0.51, 0.56);
    		glVertex3f(-1.0, 1.0, 0.0);
    		glVertex3f( 1.0, 1.0, 0.0);
    		glVertex3f( 1.0,-1.0, 0.0);
            glVertex3f(-1.0,-1.0, 0.0);
        glEnd();

        $app->sync;
    };

    sub event_loop {
        my $self = shift;
        my $app = shift;
        my $event = SDL::Event->new();

        $self->_init_gl;

        while (1) {
            SDL::Events::pump_events();
            if (SDL::Events::poll_event($event)) {
                my $mod_state = SDL::Events::get_mod_state();

                last if $event->type == SDL_QUIT;
            }

            $self->_draw_frame($app);
            $app->delay(25);
        }
    }

    __PACKAGE__->meta->make_immutable;
}

package AppStateContext {
    use Moose;
    use SDL;
    use SDLx::App;
    use SDL::Event;
    use SDL::Events ':all';

    use namespace::autoclean;

    has '_state' => (
        is => 'rw',
        isa => 'AppStatelike',
        builder => '_build_state',
    );

    sub _build_state {
        return(AppState_Active->new);
    }

    sub set_state {
        my $self = shift;
        my $new_state = shift;
        $self->_state($new_state);

        return 1;
    }

    sub event_loop {
        my $self = shift;
        my $app = shift;

        $self->_state->event_loop($app);
    }

    __PACKAGE__->meta->make_immutable;
}

package OpenGLApplication {
    use Moose;
    use SDL;
    use SDLx::App;
    use SDL::Event;
    use SDL::Events ':all';

    use constant GAMEBOARD_WIDTH => 640;
    use constant GAMEBOARD_HEIGHT => 480;

    use namespace::autoclean;

    has 'app' => (
        is => 'ro',
        isa => 'SDLx::App',
        builder => '_build_app',
    );

    has '_context' => (
        is => 'ro',
        isa => 'AppStateContext',
        builder => '_build_context',
    );

    sub _build_context {
        return(AppStateContext->new);
    }

    sub _build_app {
        return(SDLx::App->new(width => GAMEBOARD_WIDTH,height => GAMEBOARD_HEIGHT,title => 'OpenGL Template Application', gl => 1));
    }

    sub main {
        my $self = shift;
        die "Error: could not start SDL application" if not defined($self->app);
        $self->_context->event_loop($self->app);
    }

    __PACKAGE__->meta->make_immutable;
}

OpenGLApplication->new->main unless caller;

1;