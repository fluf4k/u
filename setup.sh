#!/bin/bash
export std="$(pwd)"

echo "input a number 1-9"
read aHnum

### Install Mosh (like ssh, but better for hot-spot internet)
ufw allow 60000:61000/udp
apt-get install -y mosh

### Clean up old install
rm -r /usr/local/bin/pcm /root/packetcrypt_rs
systemctl stop ah.service
rm /lib/systemd/system/ah.service
rm -r /etc/pktpool

### Clone and Build
git clone -b develop https://github.com/cjdelisle/packetcrypt_rs.git
cd packetcrypt_rs
cargo build --release
cp target/release/packetcrypt /usr/local/bin/pcm
rm -r $std/packetcrypt_rs

### Starting configuration of updated install
cd $std/pkt-aH
source $std/ENV
sed -i 's|blkpass|'$Blkpass'|g' cfg.toml
sed -i 's|paymakerpass|'$Paymakerpass'|g' cfg.toml    ### why do it in such an inefficient way?
sed -i 's|masterurl|'$Masterurl'|g' cfg.toml        ### cuz I want too...... frick off
sed -i 's|num_workerz|'$NUM_workerz'|g' cfg.toml
sed -i 's|puburl|'$Puburl'|g' cfg.toml

echo "aHnum=ah'$aHnum'" > $std/pkt-aH/ah-num

### installing AH Service
mkdir /etc/pktpool
cp -r $std/pkt-aH/* /etc/pktpool
ln -s /etc/pktpool/pkt-ah.service /lib/systemd/system/ah.service
systemctl daemon-reload
sudo systemctl enable ah.service
systemctl start ah.service
rm -r $std