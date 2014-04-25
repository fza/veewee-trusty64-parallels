echo "Fixing file permissions"
chown -R vagrant:vagrant /home/vagrant/* 2>/dev/null
chown -R vagrant:vagrant /home/vagrant/.* 2>/dev/null

echo "Cleaning apt"
apt-get -y autoremove
apt-get -y autoclean
apt-get -y clean

echo "Cleaning up dhcp leases"
rm /var/lib/dhcp/*

echo "Cleaning up udev rules"
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

rm -f /home/vagrant/*.sh

echo "Defragmenting root disk"
if which e4defrag >/dev/null; then
    e4defrag `mount | awk '/^(.*)\s+on\s+\/\s+type\s+ext4/ { print $1 }'` >/dev/null
fi

echo "Zeroing remaining disk space"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
