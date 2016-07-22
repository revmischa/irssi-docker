# killreconnect.pl
#
# Reconnects if you're killed.
#

use strict;
use vars qw($VERSION %IRSSI);

use Irssi;

$VERSION = '1.00';
%IRSSI = (
    authors	=> 'Garion',
    contact	=> 'garion@efnet.nl',
    name	=> 'killreconnect',
    description	=> 'Reconnects after a /KILL.',
    license	=> 'Public Domain',
    url		=> 'http://www.jamesoff.net',
    changed	=> '17 January 2003 10:34:38',
);


#main event handler

Irssi::signal_add('event kill', 
  sub {
    my ($server, $args, $nick, $address) = @_;
    my $reason = $args;
    $reason =~ s/^.*://g;
    Irssi::print("You were killed by $nick ($reason)."); 
    Irssi::signal_stop(); 
  }
);

# Yes, that's all. Explanation:
# <cras> garion: you could probably do that more easily by preventing
#        irssi from seeing the kill signal
# <cras> garion: signal_add('event kill', sub { Irssi::signal_stop(); });
# <cras> garion: to prevent irssi from setting server->no_reconnect = TRUE

# EOF
