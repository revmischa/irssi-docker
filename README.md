# What is this??
A carefully curated collection of irssi aliases, handy scripts, aliases and a vast collection of ANSI and ASCII art suitable for IRC.  
This is the last word in IRC clients.  

# What's included?
```
adv_windowlist.pl  cflood.pl     figlet.pl      hueg.pl           masskb.pl     timer.pl
aol.pl             chanshare.pl  fuckyou.pl     keepnick.pl       mkick.pl      trolldb.pl
autorejoin.pl      clones.pl     gay.pl         killreconnect.pl  usercount.pl
bmi.pl             dau.pl        hilightwin.pl  massgline.pl      splitlong.pl
```
* a vast collection of ANSI and ASCII art, many of it highly artistic and offensive
* copypasta aliases
* advanced window layout, highlight window, multiline channel list
* oper/superadmin/services aliases
* [256color](http://www.robmeerman.co.uk/unix/256colours) support (!)
* madcow.theme
* NO SLOWFLOODS (except efnet)

# How do I run it?
To get docker for any platform simply download it at https://www.docker.com/products/docker  
Run it with: `docker run -ti revmischa/irssi`.  
This is a docker image, ready to run on any system, be it Mac, Windows or Linux. It can also be deployed to hosting services such as AWS EC2 Container Service, DigitalOcean or any other Docker-ready provider.  
N.B. one could very easily script the creation of irssi images with your hosting provider of choice, giving you a fresh IRC client on a new IP address with a keyboard stroke, if one were so inclined. Never stay banned again!  

# Where da ANSIs?
[ANSI and ASCII art](art) is in the `art/` directory. It's not very organized, sorry. This is a directory full of lots of random artwork by chatters that has been collected over the years. Some of it is shockingly offensive and I don't recommend pasting them at random unless you like getting banned for life and shunned from your social circles IRL.  
You can "drop" an ANSI or ASCII file with the irssi alias `/drop foo.txt`.

# How do I build it?
If you have docker installed a simple `make` should do the trick.  You can easily see all of the steps performed and the software that's installed by looking at the Makefile, Dockerfile and the `build_irssi.sh` script.  
