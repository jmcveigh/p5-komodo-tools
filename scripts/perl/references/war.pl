#!/usr/bin/perl

use warnings;
use strict;
use 5.10.0;

my %dispatch_table = (
                        play    => \&play_game,
                        hello   => sub { say "\nHello, world!\n"; },
                        'exit'  => sub { say "\nGoodbye!\n"; exit; },
                    );
my $dt_ref = \%dispatch_table;

my $games_played = games_played();

while ( 1 ){

    system( "clear" );

    my @options = keys %{ $dt_ref };

    say "Enter one of these options: " . join( ' ', @options );
    chomp ( my $command = <STDIN> );

    exit if ! exists $dt_ref->{ $command };
    
    $dt_ref->{ $command }->();

    if ( $games_played->() ){
        say "You've played " . $games_played->() . " games.\n";
    }

    print "Please press ENTER...";
    <STDIN>;
}

sub play_game {

    system( "clear" );

    my %deck;
    my $card_value = 14;

    for ( qw( A K Q J ), ( reverse 2..10 ) ){

        $deck{ $_ } = $card_value;
        $card_value--;
    }    
    my @cards = keys %deck;

    print "Enter your name: ";
    chomp ( my $player = <STDIN> );

    print "Enter number of rounds (default: 5): ";
    chomp ( my $rounds = <STDIN> );
    $rounds = 5 if $rounds !~ /\d+/;

    my $players = { 
                    $player => {
                                score    => 0,
                                card     => undef,
                            },
                    npc      => {
                                score    => 0, 
                                card     => undef,
                            },
                    };

    my @player_names = keys %{ $players };

    for my $round ( 1 .. $rounds ){

        print "Round $round: ";

        for my $player ( @player_names ){

            my $card = deal( \@cards );

            print "$player $card   ";

            $players->{ $player }{ card } = $card;
        }

        compare_hands({ 
                        player_names => \@player_names,
                        players      => $players,
                        deck         => \%deck,
                     });

        print "\n";
    }

    print "\n";

    for my $player ( @player_names ){

        my $score = $players->{ $player }{ score };
        say "$player won $score rounds.";
    }

    print "\n";

    $games_played->( 1 );
}
sub deal {

    my $deck_of_cards = shift; # aref
    return $deck_of_cards->[ rand @{ $deck_of_cards } ];
}
sub compare_hands {

    my $named_params = shift;
    
    my $player_names    = $named_params->{ player_names };
    my $players         = $named_params->{ players };
    my %deck            = %{ $named_params->{ deck } };

    my ( $player1, $player2 ) = @{ $player_names };

    my $p1_card = $players->{ $player1 }{ card };
    my $p2_card = $players->{ $player2 }{ card };

    my $p1_card_val = $deck{ $p1_card };
    my $p2_card_val = $deck{ $p2_card };

    return if $p1_card_val == $p2_card_val;

    if ( $p1_card_val > $p2_card_val ){
        $players->{ $player1 }{ score }++;
    }
    else {
        $players->{ $player2 }{ score }++;
    }
}    
sub games_played {
    
    my $games_played = 0;

    return sub {
                my $add = shift;
                $games_played += $add if $add;
                return $games_played;
               }
}
