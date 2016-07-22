#!/usr/bin/perl -w
# various workarounds for silc-plugin
#  by c0ffee 
#    - http://www.penguin-breeder.org/?page=silc

#<scriptinfo>
use vars qw($VERSION %IRSSI);

use Irssi 20020519;
$VERSION = "0.3";
%IRSSI = (
    authors	=> "c0ffee",
    contact	=> "c0ffee\@penguin-breeder.org",
    name	=> "various workarounds for silc-plugin",
    description	=> "Fixes /umode (remove alias first), /op, /who, ...",
    license	=> "Public Domain",
    url		=> "http://www.penguin-breeder.org/?page=silc",
    changed	=> "Wed Jan 29 20:55 CET 2003",
);
#</scriptinfo>

sub cmd_umode {


	my ($data, $server, $channel) = @_;

	return if (not defined $server);

	if ($server->{chat_type} =~ /^irc$/i) {

		Irssi::signal_stop();
		$server->command("EVAL MODE \$N $data");

	} elsif ($server->{chat_type} =~ /^silc$/i) {

		return;

	}

}

sub cmd_op {

	my ($data, $server, $channel) = @_;

	return if (not defined $server);
	return if (not defined $channel);

	if ($server->{chat_type} =~ /^silc$/i) {


		Irssi::signal_stop();
		foreach (split /\s+/, $data) {
			$server->command("CUMODE $channel->{name} +o $_");
		}
		
	}

}

sub cmd_deop {

	my ($data, $server, $channel) = @_;

	return if (not defined $server);
	return if (not defined $channel);

	if ($server->{chat_type} =~ /^silc$/i) {


		Irssi::signal_stop();
		foreach (split /\s+/, $data) {
			$server->command("CUMODE $channel->{name} -o $_");
		}
		
	}

}

sub cmd_who {


	my ($data, $server, $channel) = @_;

	return if (not defined $server);

	if ($server->{chat_type} =~ /^silc$/i) {

		$data = $channel->{name} if $data eq "";
		$server->command("USERS $data");
		Irssi::signal_stop();

	}

}

sub cmd_detach {
	
	my ($data, $server, $channel) = @_;

	if ($data =~ /^-clear/i) {
	  if (-f Irssi::get_irssi_dir() . "/silc_session") {
	    unlink(Irssi::get_irssi_dir() . "/silc_session");
	    Irssi::print("removed old session data");
	  } else {
	    Irssi::print("no old session data present");
	  }
	  Irssi::signal_stop();
	}
}

sub sig_ownpub {
  my ($server, $msg, $target) = @_;

  if (($server->{chat_type} =~ /^silc$/i) && 
      (Irssi::settings_get_bool("sign_messages"))) {

    Irssi::signal_stop();
    $server->command("SMSG -channel $target $msg");

  }

}

sub sig_sendtext {
  my ($line, $server, $witem) = @_;
  return unless ref $witem;

  if (($server->{chat_type} =~ /^silc$/i) && 
      (Irssi::settings_get_bool("sign_messages"))) {

    return if $line eq "";

    if ($witem->{type} eq "CHANNEL") {
      $target = "-channel $witem->{name}";
    } elsif ($witem->{type} eq "QUERY") {
      $target = "$witem->{name}";
    } else {
      return;
    }

    Irssi::signal_stop();
    $server->command("SMSG $target $line");

  }

}

Irssi::print("removing /UMODE alias...");
Irssi::command("UNALIAS UMODE");
Irssi::command_bind("umode", "cmd_umode");
Irssi::command_bind("op", "cmd_op");
Irssi::command_bind("deop", "cmd_deop");
Irssi::command_bind("who", "cmd_who");
Irssi::command_bind("detach", "cmd_detach");
Irssi::signal_add_first("send text", "sig_sendtext");


Irssi::settings_add_bool("silc", "sign_messages", 0);
