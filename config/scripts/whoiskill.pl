#!/usr/bin/perl

use strict;
use vars qw($VERSION %IRSSI);
use Irssi;
use Irssi::Irc;
use Data::Dumper;

$VERSION = '1.00';
%IRSSI = (
          authors     => 'h8crime',
          contact     => 'sex',
          name        => '',
          description => qq {
              Kill anyone who does a whois on you
          },
          license     => 'BPL',
          );

Irssi::command_bind('whoiskill' => \&handle_cmd);
Irssi::signal_add("message irc notice", \&whois);

my $enabled = 1;

sub whois {
    my ($server, $note) = @_;
    return unless $enabled;
    return unless $note;

    my ($nick, $nickid) = $note =~ /\**\s*(\S+) \([^)]*\) did a \/whois on you/i;
    return unless $nick;

    $nickid ||= '';
    Irssi::print("$nick ($nickid) did a whois on you. Killing.");
    $server->command("kill $nick no nicks");
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

    Irssi::print("Whois autokill enabled=$enabled");
}
