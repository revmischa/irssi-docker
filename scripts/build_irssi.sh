mkdir -p $DEPS_HOME
cd $DEPS_HOME
apt-get update
apt-get install -y wget libotr5-dev
wget https://github.com/irssi/irssi/releases/download/$IRSSI_RELEASE/irssi-${IRSSI_RELEASE}.tar.gz

