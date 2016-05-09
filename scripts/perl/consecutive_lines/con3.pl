#!/usr/bin/perl

use warnings;
use strict;

my @hold;
my @data;

while ( my $line = <DATA> ){
    
    chomp $line;

    if ( $line =~ /NIL$/ || $line !~ /\w+/ ){

        if ( scalar @hold > 1 ){
            push @data, [ @hold ]; 
        }
        undef @hold;
        next;
    }
    push @hold, $line;
}

for my $block ( @data ){
    for my $entry ( @{ $block } ){
        print "$entry\n";
    }
    print "\n";
}

__DATA__
1yxq_SWI_B_600   =   c.55.1.1-
      
      
      
1grh_ADW_A_479   =   NIL
      
      
      
      
1fm9_570_D_200   =   a.123.1.1-
1ec1_BEE_A_501   =   b.50.1.1-
      
1fm9_570_D_200   =   a.123.1.1-
2zmh_NYA_A___1   =   a.123.1.1-
      
1gvh_HQQ_A1398   =   a.1.1.2-c.25.1.5-
1v9y_HDQ_A1140   =   d.110.3.2-
1v9y_HDQ_A1140   =   d.110.3.2-

1mqt_SPL_A_284   =   NIL
