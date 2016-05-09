#!/usr/bin/perl

use warnings;
use strict;

print "Enter filename:";
chomp( my $list_filename = <STDIN> );

open my $list_fh, '<', $list_filename 
  or die "Can't open the file that contains the other filenames!: $!";

my @storage; # store the lines in here
my $pattern = qr/hello /;

while ( my $inner_filename = <$list_fh> ){

  chomp $inner_filename;

  # ensure the files actually exist

    if ( -e $inner_filename ){

        open my $inner_file_fh, '<', $inner_filename
          or die "Can't open $inner_filename!: $!";

        print "$inner_filename\n";    # Print the file name to indicate the different output

        while ( my $inner_line = <$inner_file_fh>) {

            chomp $inner_line;

            if ( $inner_line =~ /$pattern/ ){

                print "$inner_line\n";
                push @storage, $inner_line; 
            }
        }
        close $inner_file_fh;
    }
}
close $list_fh;

# combine all lines removing duplicates
# see: perldoc -q duplicate

my ( @unique, %seen );

foreach my $elem ( @storage ){
    next if $seen{ $elem }++;
    push @unique, $elem;
}

print "\n\nResults:\n\n";
print join( "\n", @unique );

