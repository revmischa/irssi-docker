use Irssi;
use Irssi::Irc;
use Time::HiRes qw(time);
use Digest::MD5 qw(md5_hex);


#__        ___    ____  _   _ ___ _   _  ____   _   _ ____ ___ _   _  ____ 
#\ \      / / \  |  _ \| \ | |_ _| \ | |/ ___| | | | / ___|_ _| \ | |/ ___|
# \ \ /\ / / _ \ | |_) |  \| || ||  \| | |  _  | | | \___ \| ||  \| | |  _ 
#  \ V  V / ___ \|  _ <| |\  || || |\  | |_| | | |_| |___) | || |\  | |_| |
#   \_/\_/_/   \_\_| \_\_| \_|___|_| \_|\____|  \___/|____/___|_| \_|\____|
#                                                                          
# _____ _   _ _____ ____  _____   ____   ____ ____  ___ ____ _____ ____  
#|_   _| | | | ____/ ___|| ____| / ___| / ___|  _ \|_ _|  _ \_   _/ ___| 
#  | | | |_| |  _| \___ \|  _|   \___ \| |   | |_) || || |_) || | \___ \ 
#  | | |  _  | |___ ___) | |___   ___) | |___|  _ < | ||  __/ | |  ___) |
#  |_| |_| |_|_____|____/|_____| |____/ \____|_| \_\___|_|    |_| |____/ 
#                                                                        
# __  __    _ __   __  ____  _____    _    _     _  __   __
#|  \/  |  / \\ \ / / |  _ \| ____|  / \  | |   | | \ \ / /
#| |\/| | / _ \\ V /  | |_) |  _|   / _ \ | |   | |  \ \// 
#| |  | |/ ___ \| |   |  _ <| |___ / ___ \| |___| |___| |  
#|_|  |_/_/   \_\_|   |_| \_\_____/_/   \_\_____|_____|_|  
#                                                          
# _____ _   _  ____ _  _____ _   _  ____      _    _   _ _   _  _____   __
#|  ___| | | |/ ___| |/ /_ _| \ | |/ ___|    / \  | \ | | \ | |/ _ \ \ / /
#| |_  | | | | |   | ' / | ||  \| | |  _    / _ \ |  \| |  \| | | | \ V / 
#|  _| | |_| | |___| . \ | || |\  | |_| |  / ___ \| |\  | |\  | |_| || |  
#|_|    \___/ \____|_|\_\___|_| \_|\____| /_/   \_\_| \_|_| \_|\___/ |_|  
#                                                                         
#__   _____  _   _ ____    _   _ ____  _____ ____  ____  
#\ \ / / _ \| | | |  _ \  | | | / ___|| ____|  _ \/ ___| 
# \ V / | | | | | | |_) | | | | \___ \|  _| | |_) \___ \ 
#  | || |_| | |_| |  _ <  | |_| |___) | |___|  _ < ___) |
#  |_| \___/ \___/|_| \_\  \___/|____/|_____|_| \_\____/ 
                                                        

use vars qw($VERSION %IRSSI); $VERSION = "2.1";
%IRSSI = (
authors => "Goat-See",
contact => "mrtheplague@gmail.com",
name => "fuckyou",
description => "/fuckyou NICK numberchannels",
license => "urmom",
url => "http://www.buttes.org/",
          );

my $FORCEPART = "sapart"; # Change these if your ircd is not gay/unreal and uses
my $FORCEJOIN = "sajoin"; # forcejoin and forcepart as the command

my $FURRY = "gaschamber";
sub cmd_fuckyou
{
    my ($data, $server, $dest) = @_;
    my ($nick, $amt_end) = split(/ +/, $data);
        unless($nick && $amt_end)
        {
            Irssi::print("/fuckyou <nick> <amt>");
              return;
          }

        for(1 .. $amt_end)
        {
            my $nig = md5_hex($$ * time * $_);
            $server->command("$FORCEJOIN $nick #${FURRY}_$nig");
            }
}

sub cmd_unfuckyou
{
    my ($data, $server, $channel)= @_;
    return Irssi::print("/unfuckyou user user2 user3") unless $data;
    foreach my $dick (split(" ", $data))
    {
        @niggers=();
            $server->redirect_event(
                "whois", 1, $dick, 0, 
                undef,
                                    {
                    "event 319" => "redir autowhois_channels",
                    "" => "event empty"
                    }
                                    );
        $server->send_raw("WHOIS :$dick");
    }
}

sub event_whois_channels
{
    my ($server, $data) = @_;
    my ($num, $nick, $channels) = split(/ +/, $data, 3);
    my @niggers = ();
    my $counter=0;

    $channels =~ s/^://;
    $channels =~ s/[ ]{1,}$//;

    @niggers = split(' ', $channels);
    foreach (@niggers)
    {
        s/[@%+]([&#])/$1/;
        if(/[&#](fuck_you|owned_by_penisbird|$FURRY)_[a-f0-9]+/i)
             {
            #Irssi::print("Forceparting $nick from $_");
                 $server->send_raw("$FORCEPART $nick $_");
                 $counter++;
             }
         }
           Irssi::print("Forceparted $nick from $counter channels") if $counter;
       }

Irssi::command_bind('fuckyou', 'cmd_fuckyou');
Irssi::command_bind('unfuckyou', 'cmd_unfuckyou');
Irssi::signal_add(
{
    'redir autowhois_channels'      => \&event_whois_channels,
});
