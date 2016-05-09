#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

# define the classrooms

my @room_1 = qw( steve mike dawn megan );
my @room_2 = qw( chris alexa melissa dave );
my @room_3 = qw( brittany hakim francois );

# declare the school. we'll declare it as a scalar
# because we're going to use an anonymous hash

my $school; # will become an href

# add the classrooms to the school

$school->{ room1 } = \@room_1;
$school->{ room2 } = \@room_2;
$school->{ room3 } = \@room_3;

# who's in room 2?

for my $student ( $school->{ room2 } ){
#    say $student;
}
#say $school{ room2 };

push @{ $school->{ room3 } }, 'jeremy'; 

$school->{ room3 }[3] = 'jeremy';

# get the keys by dereferencing $school

for my $room_name ( sort keys %{ $school } ){
    
    say "Students in $room_name: ";
    print "    ";

    # get each student name from each class by
    # dereferencing each class aref

    for my $student ( @{ $school->{ $room_name } } ){
        print "$student ";
    }
    print "\n";
}    


