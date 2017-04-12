#!/bin/perl
 
 
use strict;
use Irssi;
use LWP::UserAgent;
use vars qw($VERSION %IRSSI);
 
$VERSION= '1.0';
%IRSSI = (
        authors => 'munki',
        contact => 'thatfunkymunki@gmail.com',
        name => 'trolldb',
        description => 'trolls people from trolldb',
        license => 'BSD',
        url => 'none',
        changed => '08-22-2011 0325'
);
 
sub query {
        my ($data, $server, $witem) = @_;
        my $ua = LWP::UserAgent->new;
        $ua->agent("irssi/0.1");
        my $request = HTTP::Request->new(GET => "http://rolloffle.churchburning.org/troll_me_text.php");
        my $result = $ua->request($request);
        my $content = $result->content;
         
        $witem->command("SAY $content");
}