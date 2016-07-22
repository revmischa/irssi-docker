#!/usr/bin/perl

use strict;
use vars qw($VERSION %IRSSI);
use Irssi;
use Irssi::Irc;

  use Email::Sender::Simple qw(sendmail);
  use Email::Simple;
  use Email::Simple::Creator;

my $email = 'CHANGEME@CHANGEME.FOO';


$VERSION = '1.00';
%IRSSI = (
          authors     => 'jenk',
          contact     => 'jenk',
          name        => 'gaol',
          description => qq {
              Send an email when a private message is received for users that are in jail
          },
          license     => 'BPL',
          );

Irssi::signal_add("message private", \&msg);

sub msg {
    my ($server, $msg, $nick, $addr) = @_;

    my $email = Email::Simple->create(
                                      header => [
                                                 To      => "\"ReadError\" <$email>',
                                                 From    => "\"$nick\" <$addr>",
                                                 Subject => "New PM",
                                                 ],
                                      body => "< $nick> $msg\n",
                                      );
    sendmail($email);
}
