apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install vim dkms nfs-common curl
