#!/usr/bin/perl

use strict;
use vars qw($VERSION %IRSSI);
use Irssi;
use Irssi::Irc;

$VERSION = '1.00';
%IRSSI = (
          authors     => 'canada420',
          description => qq {
              Set +c when someone starts to flood with color
          },
          license     => 'BPL',
          );

Irssi::command_bind('nocolor' => \&handle_cmd);
Irssi::signal_add("message public", \&msg);

my $enabled = 1;
my %last_msg;

sub msg {
    my ($server, $msg, $nick, $addr, $target) = @_;

    return unless $enabled;
    return unless $msg && ($msg =~ /\033\[\d+;\d+;m/ || $msg =~ /\003\d+/);

    my $msgkey = "$nick$addr$target";

    my $last_msg_time = $last_msg{$msgkey};
    $last_msg{$msgkey} = time();

    if ($last_msg_time && time() - $last_msg_time < 2) {
        Irssi::print("[Color flood from $nick ($addr) in $target]");
        $server->command("mode $target +c");
    }
}

sub handle_cmd {
    my ($data, $server, $witem) = @_;

    if ($data) {
        if ($data =~ /^\s*on\b/i) {
            $enabled = 1;
        } elsif ($data =~ /^\s*off\b/i) {
            $enabled = 0;
        }
    }

    Irssi::print("Color flood ruiner = " . ($enabled ? 'on' : 'off'));
}
