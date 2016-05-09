#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

# define a package to simulate loading an external
# file containing the functions

{
    package Test;

    sub LaunchApplication {
        my ( $exec, $dir ) = @_;
        say "In Test::LaunchApplication()";
        say "params: $exec, $dir";
        return 0;
    }
    sub SelectMenu {
        say "In Test::SelectMenu()";
        return 0;
    }
    sub Dothis {
        say "In Test::Dothis()";
        return 1;
    }
    sub sayHello {
        say "In Test::sayHello()";
        return 0;
    }
}


# main program

package main;

my $package = "Test";

# fetch the data structure

my $operations = get_operations();

for my $testcase ( sort keys %$operations ){

    my $curr_testcase = $operations->{ $testcase };

    for my $step_name ( sort keys %{ $operations->{ $testcase } } ){
       
        say "\nWorking on $testcase, $step_name"; 

        my $step = $curr_testcase->{ $step_name };

        my $command = $step->{ command };
        delete $step->{ command };

        my $return;
        {
            no strict 'refs';
            $return = "${package}::$command"->( sort values %$step );
        }

        if ( $ret != 0 ){        
            say "\n\n$testcase, $step_name command returned error status. exiting.\n";
            exit();
        }
    }
}
sub get_operations {

    my $operations = {
        'testcase1' => {
                         'step1' => {
                                    'command' => 'LaunchApplication',
                                    'param1' => '/usr/bin',
                                    'param2' => '/home/stevieb'
                                  },
                         'step2' => {
                                    'command' => 'SelectMenu', 
                                  },
                       },
         'testcase2' => {
                         'step1' => {
                                    'command' => 'LaunchApplication',
                                    'param1' => '/usr/local/bin',
                                    'param2' => '/var/log'
                                  },
                         'step2' => {
                                    'command' => 'Dothis',
                                  },
                         'step3'  => {
                                    'command' => 'sayHello',
                                  },
 
                        },
         };
}

