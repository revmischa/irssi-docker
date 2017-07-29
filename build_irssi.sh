mkdir -p $DEPS_HOME
cd $DEPS_HOME
apt-get update
apt-get install -y wget libotr5-dev gcc libglib2.0-dev libperl-dev libssl-dev \
  figlet libncurses-dev liblwp-protocol-https-perl cpanminus screen unzip \
  libjpeg62 less
cpanm LWP::Simple
wget https://github.com/irssi/irssi/releases/download/$IRSSI_RELEASE/irssi-${IRSSI_RELEASE}.tar.gz
tar -zxf irssi-${IRSSI_RELEASE}.tar.gz
cd irssi-${IRSSI_RELEASE}
./configure --enable-true-color && make -j7 && make install
apt-get remove -y gcc build-essential
apt-get autoremove -y
