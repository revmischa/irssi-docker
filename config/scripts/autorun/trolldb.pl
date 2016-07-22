use Irssi;
use Irssi::Irc;

use strict;
use warnings;

use LWP::Simple;

use vars qw($VERSION %IRSSI); $VERSION = "1.0";

%IRSSI = (
          authors => "canada420",
          name => "autotroll",
          description => "/troll",
          license => "BPL",
          url => "http://www.buttes.org/",
);

Irssi::command_bind('troll', 'cmd_troll');

sub cmd_troll {
    my ($data, $server, $dest) = @_;
    my $win = Irssi::active_win();

    return unless $dest;

    my $line = LWP::Simple::get(q!http://rolloffle.churchburning.org/troll_me_text.php!);
    my $cmd = "say ";

    $dest->command("$cmd$line");
}
