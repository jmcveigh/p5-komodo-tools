#!/usr/bin/perl

    use warnings;
    use strict;

    use Benchmark qw(cmpthese timethese);
    use Storable;

    my $file = 'cmp.txt';

    storeit();

    cmpthese(100, {
        'by_line' => \&by_line,
        'by_slurp' => \&by_slurp,
        'by_store' => \&by_store,
    });

    sub by_line {

        open my $fh, '<', $file
          or die "Can't open $file: $!";

        my @ref_data;

        for my $line (<$fh>){
            push @ref_data, $line;
        }
    }

    sub by_slurp {

        open my $fh, '<', $file
          or die "Can't open $file: $!";

        my @ref_data = <$fh>;
    }  

    sub storeit {
        open my $fh, '<', $file
          or die "Can't open $file: $!";

        my @ref_data = <$fh>;
        close $fh;
        
        store \@ref_data, 'store.dat';
    }

    sub by_store{

        my @ref_data = retrieve('store.dat');
    }
