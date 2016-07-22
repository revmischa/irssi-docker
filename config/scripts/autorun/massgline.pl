use strict;
use vars qw($VERSION %IRSSI);
use Irssi qw(command_bind command_runsub);

$VERSION = '1';
%IRSSI = (
    authors	=> 'canada420',
    name	=> 'MassGLine',
    description	=> 'gline a list of IPs',
    license	=> 'GPLv2',
);

command_bind 'massgline' => sub {
    my ($data, $server, $item) = @_;

    my @ips = split(/\s+/, $data);
    foreach my $ip (@ips) {
        next unless $ip && $ip =~ /\w/;
        $server->command("quote gline *\@$ip 0 dummie detected");
    }
};
