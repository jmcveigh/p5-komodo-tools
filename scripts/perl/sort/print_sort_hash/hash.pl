#!/usr/bin/perl

use strict;
use warnings;

my $href = {
          '149' => {
                     '05' => '1',
                     '06' => '1',
                     '00' => '1',
                     '01' => '2',
                     '02' => '2',
                     '03' => '2',
                     '04' => '2'
                   },
          '077' => {
                     '05' => 'ND',
                     '06' => 'ND',
                     '00' => 'ND',
                     '01' => 'ND',
                     '02' => 'ND',
                     '03' => 'ND',
                     '04' => 'ND'
                   },
          '078' => {
                     '05' => '1',
                     '06' => '1',
                     '00' => '1',
                     '01' => '1',
                     '02' => '1',
                     '03' => '1',
                     '04' => '1'
                   },
};

sub ND_or_multiple {
  my $key = shift;
  my %uniq;
  for my $value (values %{ $href->{$key} }) {
    return 1 if $value eq 'ND';
    $uniq{$value}++;
    return 1 if keys %uniq > 1;
  }
  return '';
}

my @wanted = grep ND_or_multiple($_), keys %$href;

for my $cell ( @wanted ){
    print "$cell: ";

    foreach my $hr ( sort keys %{ $href->{$cell}} ) {
        print "\t$hr $href->{$cell}{$hr}";
    }
  print "\n";
}

__END__

foreach ( @wanted ){
    print "$_:\n";
    foreach ( values %{ $href->{ $_ } } ){
       print "\t$_\n";
    }
} 
