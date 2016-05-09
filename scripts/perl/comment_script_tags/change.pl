#!/usr/bin/perl

use warnings;
use strict;

open my $fh, '<', 'file.aspx' or die "Can't open the damn file for reading!: $!";

my @file_content;

while ( my $line = <$fh> ){
    chomp $line;

    if ( $line =~ /^<script>/ ){
        $line = "<%-- $line";
        push @file_content, "$line\n";
        next;
    }
    elsif ( $line =~ /^<\/script>$/ ){
        $line .= " -->";
        push @file_content, "$line\n";
        next;
   }
    elsif ( $line =~ /^<%--\s+<script>/ ){
        $line =~ s/^<%--\s+//;
        push @file_content, "$line\n";
        next;
    }
    elsif ( $line =~ /^<\/script>\s+-->/ ){
        $line =~ s/\s+-->//;
        push @file_content, "$line\n";
        next;
  }
    push @file_content, "$line\n";
}

close $fh;

open $fh, '>', 'file.aspx' or die "Can't open the damned file for writing: $!";
print $fh @file_content;
close $fh;
