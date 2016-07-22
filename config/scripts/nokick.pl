#!/usr/bin/perl

use strict;
use warnings;
use vars qw($VERSION %IRSSI);
use Irssi;
use Irssi::Irc;
use Data::Dumper;

$VERSION = '1.00';
%IRSSI = (
          authors     => 'h8crime',
          name        => '',
          description => qq {
              Try to -o anyone who sets +b on you before they can /kick
          },
          license     => 'BPL',
          );

Irssi::signal_add("ban new", \&new_ban);

sub new_ban {
    my ($chan, $ban) = @_;

    my $from = $ban->{setby};
    my $who = $ban->{ban};
    return unless $from && $who;

    my ($ban_ident, $ban_uname, $ban_hostmask) = $who =~ /(.+)(?:\!(.+))\@(.+)/;
    return unless $ban_ident && $ban_uname && $ban_hostmask;

    $ban_uname =~ s/\*//;
    $ban_hostmask =~ s/\*//;

    my $host = $chan->{server}->{userhost};

    my ($uname, $hostmask) = $host =~ /(.+)\@(.+)/;
    return unless $uname && $hostmask;

    return unless $ban_uname eq $uname || $ban_hostmask eq $hostmask;

    my $channame = $chan->{name};
    $chan->command("/mode -o $from");
    $chan->command("/mode -b $who");
    $chan->command("/kb $from");
}
