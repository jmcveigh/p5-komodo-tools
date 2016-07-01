 1  $Tk::LabOptionmenu::VERSION = '1.0';
 2
 3  package Tk::LabOptionmenu;
 4
 5  use Tk::widgets qw/Optionmenu/;
 6  use base qw/Tk::Frame/;
 7  use strict;
 8
 9  Construct Tk::Widget 'LabOptionmenu';
10
11  sub ClassInit {
12
13      my($class, $mw) = @_;
14      $class->SUPER::ClassInit($mw);
15
16  } # end ClassInit
17
18  sub Populate {
19
20      my($self, $args) = @_;
21
22      $self->SUPER::Populate($args);
23      my $o = $self->Optionmenu->pack;
24      $self->Advertise  ( 'optionmenu' =>  $o  );
25      $self->ConfigSpecs( 'DEFAULT'    => [$o] );
26      $self->Delegates  ( 'DEFAULT'    =>  $o  );
27
28  } # end Populate
29
30  1;
