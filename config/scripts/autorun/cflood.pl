#!/usr/bin/perl
#{{{ BSD License
# Copyright (c) 2008 hzu/zionist
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or
# without modification, are permitted provided that the following
# conditions are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
# THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL  DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#}}}

use warnings;
use strict;
use vars qw($VERSION %IRSSI $NAME);
use Irssi;

$NAME = "colourflood";
$VERSION = "0.1";

%IRSSI = (
  name        => $NAME,
  version     => $VERSION,
  author      => 'hzu',
  contact     => 'irc',
  license     => 'BSD',
  description => 'A-rab style ircing'
          );

my $USAGE = "/$NAME" . <<EOF;
  [options] text
    options:
    -r      Random back & foreground colours
    -f      Amount of times the message is flooded
    -fg     font colour, available colours:
              black, blue, green
              lightred, red, magenta, orange
              yellow, lightgreen, cyan,
              lightcyan, lightblue,
              lightmagenta, gray, lightgray.
    -bg     background colour, available colours:
              black, blue, green, red,
              magenta, orange, green, cyan,
              lightcyan, lightblue,
              lightmagenta, gray, lightgray
EOF

Irssi::theme_register(
  [
    not_connected   =>    '%_$0:%_ You\'re not connected to server',
    no_window      =>     '%_$0:%_ Not joined to any channel or query window',
    wrong_clr        =>   '%_$0:%_ Specified colourcode does not exit.',
    wrong_arguments =>    $USAGE
    ]
                      );

our %clr = (
  'black'        => '1',
  'blue'         => '4',
  'green'        => '3',
  'lightred'     => '4',
  'red'          => '5',
  'magenta'      => '6',
  'orange'       => '7',
  'yellow'       => '8',
  'lightgreen'   => '9',
  'cyan'         => '10',
  'lightcyan'    => '11',
  'lightblue'    => '12',
  'lightmagenta' => '13',
  'gray'         => '14',
  'lightgray'    => '15',
            );

sub parse {
    my @args = ( split / +/, shift @_ );
    my ( %todo, $text, $body );

    while ( $_ = shift @args ) {
        /^-r$/ and $todo{'r'} = 1, next;
        /^-f$/ and $todo{'f'} = shift @args, next;
        /^-fg$/ and $todo{'fg'} = shift @args, next;
        /^-bg$/ and $todo{'bg'} = shift @args, next;
        /^-/ and Irssi::printformat( MSGLEVEL_CRAP, "wrong_arguments" ), return;
        $text = ( $#args < 0 ) ? $_ : $_ . " " . join( " ", @args );
        last;
    }

    if ( $todo{'r'} ) {
        $body = "";
        my @rnd_clr = keys %clr;
        foreach ( 1 .. (defined $todo{'f'} ? $todo{'f'} : 1 ) ) {
            $body .= colour( $rnd_clr[rand @rnd_clr], $rnd_clr[rand @rnd_clr], $text, $todo{'f'});
            $body .= "\n";
        }
    }
    else {
        $body = "";
        foreach ( 1 .. (defined $todo{'f'} ? $todo{'f'} : 1 ) ) {
            $body .= colour( $todo{'fg'}, $todo{'bg'}, $text );
            $body .= "\n";
        }
    }
    return $body;
}


sub colour {
    my ($fg, $bg, $text) = @_;
    my $fore = $clr{$fg};
    my $back = $clr{$bg};
    $fore++ if $fore == $back;
    $text = "\003$fore,$back $text \003$back,$fore $text ";
    $text = $text x(int 400 / length $text);
    return $text;
}


sub cflood {
    my ( $data, $server, $witem ) = @_;
    my $ret;

    if ( !$server || !$server->{connected} ) {
        Irssi::printformat( MSGLEVEL_CRAP, "not_connected" );
          return;
      }
    if ( !$witem || $witem->{type} !~ /CHANNEL|QUERY/ ) {
        Irssi::printformat( MSGLEVEL_CRAP, "no_window" );
          Irssi::printformat( MSGLEVEL_CRAP, "wrong_arguments" );
          return;
      }
    if ( !$data ) {
        return;
    }

    chomp( $ret = parse( $data ) );
    if ( $ret =~ /\n/ ) {
        map { $witem->command( "say " . $_ ) } ( split /\n/, $ret );
    }
    else { $witem->command( "say " . $ret ); }
}

Irssi::command_bind( 'cflood', 'cflood' );
