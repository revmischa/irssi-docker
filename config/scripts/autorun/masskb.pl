use warnings;
use strict;
use vars qw/$VERSION %IRSSI/;
use Irssi;

$VERSION = 0.001;

%IRSSI = (
    author      => 'aesop',
    contact     => '#caretown',
    description => q{
        This script is highly useful in that it (for the active channel) 
        removes all ops/halfops, kickbans everyone and sets a bunch of wack 
        channel modes. the channel cleansing will exclude yourself and 
        anyone in the exception list (see usage section below).
 
        Usage: 1. /script load masskb.pl
               2. switch active window to target channel
               3. /masskb <list of nick exceptions> (e.g. '/masskb john sally sue')

    },
    license     => 'CUSSE',
);


sub masskb {
    my ($data, $server, $target_channel) = @_;

    # check for channel object
    unless ($target_channel && $target_channel->{type} eq 'CHANNEL') {
        warn "No target channel found, aborting\n";
        return;
    }

    # check if we have ops
    unless ($target_channel->{ownnick}->{op}) {
        warn "Acquire operator status first, aborting\n";
        return;
    }

    # build list of nicks not to kb
    my $exceptions = [];
    @$exceptions = split /\s+/, $data if $data;

    # add ourselves to exceptions
    push @$exceptions, $target_channel->{ownnick}->{nick};
    
    # get nick objects of target channel
    my @channel_nicks = $target_channel->nicks;
    
    # remove exceptions from list
    my $nicks = [];
    foreach my $nick (@channel_nicks) {
        next if grep { $nick->{nick} eq $_ } @$exceptions;
        push @$nicks, $nick;
    }
    
    # check if there are any nicks left
    unless (scalar @$nicks) {
        warn "No nicks found, aborting\n";
        return;
    }


    # this section is sort of a wack way of deopping as many people
    # at once as possible, will likely be refactored

    # build mode string of deops + dehalfops with nicks
    my ($ops, $halfops, $opcount, $halfopcount, $modes, $names);
    foreach my $nick (@$nicks) {

        # are they an op?
        if ($nick->{op}) {
            $ops .= $nick->{nick} . ' ';
            $opcount++;
        }

        # are they a halfop ?
        if ($nick->{halfop}) {
            $halfops .= $nick->{nick} . ' ';
            $halfopcount++;
        }

    }

    # add an o to the modes for each op and the list of nicks
    if ($ops) {
        $modes .= 'o' x $opcount;
        $names .= $ops;
    }

    # same as above except with halfops
    if ($halfops) {
        $modes .= 'h' x $halfopcount;
        $names .= $halfops;        
    }

    # check if we have any names at all
    if ($names) {
        # then deop & dehalfop everyone
        $target_channel->command("mode -$modes $names");
    }


    # ban everyone 
    foreach my $nick (@$nicks) {
        my $name = $nick->{nick};
        $target_channel->command("kb $name");
    }

    # set a bunch of wack modes, comment this out if you don't want it to
    $target_channel->command('mode +ismGQclk 1 39djzj3');


}

Irssi::command_bind('masskb', 'masskb');
