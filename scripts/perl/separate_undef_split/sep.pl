#!/usr/bin/perl

use warnings;
use strict;

# throw away the empty side of the first split
# with undef. split on :\d (colon and a single
# digit. Throw away the colon but keep the digit
# and use it as the hash key, and the rest of the
# line up to the next :\d in the value.

# add a + to the \d if you will have double-digits

my ( undef, %hash ) = split( /:(\d)/, <DATA> );

# sort the hash keys in numerical order

for my $key ( sort { $a <=> $b } keys %hash ){

    # check all the values for a *, and remove it

    $hash{ $key } =~ s/\*//;
    
    # print

    print "$key: $hash{ $key }\n\n";
}

__DATA__
:1MSALGAVIALLLWGQLFAVDSGNDVTDIADDGCPKPPEIAHGYVEHSVRYQCKNYYKLRTEGDGVYTLNDKKQWINKAVGDKLPECEADDGCPKPPEI AHGYVEHSVRYQCKNYYKLRTEGDGVYTLNNEKQ:5NPANPVQRILGGHLDAKGSFPWQAKMVSHHNLTTGATLINEQWLLTTAKNLFLNHSENATAKDI APTLTLYVGKKQLVEIEKVVLHPNYSQVDIGLIKLKQKVSVNE:3DQCIRHYEGSTVPEKKTPKSPVGVQPILNEHTFCAGMSKYQEDTCYGDAGSAFAV HDLEEDTWYATGILSFDKSCAVAEYGVYVKVTSIQDWVQKTIAEN:2SASLQFHGNVDADIRYDISLDPARESNLFRLLMGLQLANGTKPSPRLPKWWPK RLEMIGKVLPKAYCSMVIFTSLHLGVLFTKTTLDVLPTGELQAITDALTMTIIYFFTGYGTIYWCLRSRRLLAYMEHMNREY:4AFRMSRNFTVVWIMSC LLGVISWGVSPLMLGIRMLPLQCWYPFDALGPGTYTAVYATQLFGQIMVGMTFGFGGSLFVTLSLLLLGQFDVLYCSLKNLDAHTKLLGGESVNGLSSLQ EELLLGDSKRELNQYV:6PDQGNAFHNALVECIRLHRFILHCSQELENLFSPYCLVKSLQITFQLCLLVFVGVSGTREVLRIVNQLQYLGLTIFELLMFT YCGELLSRHSIRSGDAFWRGAWWKHAHFIRQDILIFLVNSRRAVHVTAGKFYVMDVNRLRSVITQAFSFLTLLQKLAAKKTESEL:7LLILRISEIGYGY KTLEENEQDLVNCIRDQNALYRLLDVTKSLVSYPMMVQFMVIGINIAITLFVLIFYVETLYDRIYYLCFLLGITVQTYPLCYYGTMVQESFAELHYAVFC SNWVDQSASYRGHMLILAERTKRMQLLLAGNLVPIHLSTYVACWKGAYSFFTLMADRDGLGS*