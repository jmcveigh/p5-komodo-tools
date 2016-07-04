$Tk::LabOptionmenu::VERSION = '1.0';
 
package Tk::LabOptionmenu {

use Tk::widgets qw/Optionmenu/;
use base qw/Tk::Frame/;
use strict;
 
Construct Tk::Widget 'LabOptionmenu';

sub ClassInit {
    my($class, $mw) = @_;
    $class->SUPER::ClassInit($mw);
}

sub Populate {
    my($self, $args) = @_;

    $self->SUPER::Populate($args);
    my $o = $self->Optionmenu->pack;
    $self->Advertise  ( 'optionmenu' =>  $o  );
    $self->ConfigSpecs( 'DEFAULT'    => [$o] );
    $self->Delegates  ( 'DEFAULT'    =>  $o  );
}

1;