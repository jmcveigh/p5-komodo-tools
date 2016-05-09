#!/usr/bin/perl

use warnings;
use strict;

my $want = 0;

while ( my $line = <DATA> ){

    next unless $line =~ /A/ && ! $want;
    if ( $line =~ /(^\w$)/ ){
        $want = 0 
    $want = 1 if $line =~ /A/;


__DATA__
A
7.803481E-01   8.228973E-01   7.515242E-01    2      1833
-5.5000000000     308.3889771284     5   0   7     1.7084151661
1.6790503987       2.75458
53558
 7.866901E-01   8.410519E-01   9.981456E-01    2     14485
-5.5000000000     269.6201271260    39   4   7    -2.5561279716
-3.5975355928       1.5117
155069
C
 7.735338E-01   9.981671E-01   7.735798E-01    2     11514
-5.5000000000     289.1918534266    31   1   7    -5.6311359613
-0.0502358314       0.0768
146957
 5.907322E-02   6.045568E-02   3.388628E-02    1        28
-6.5000000000     336.0228260493     1   2   7     0.8177802191
3.9634621584      -3.0314
370501
A
2.764127E-02   3.230161E-02   1.633790E-02    1        51
-6.5000000000     319.7604886848     1   3   7     0.7583797888
3.5176580829      -1.87872
93439
 5.960780E-02   2.111333E-02   1.066835E-01    1        62
-6.5000000000     297.7363059936     1   1   7     2.2257828331
3.7887567121      -3.4478
600377
