#!/bin/bash
export std="$(pwd)"
ufw allow 60000:61000/udp
apt-get install -y mosh
rm -r /usr/local/bin/pcm /root/packetcrypt_rs
git clone -b develop https://github.com/cjdelisle/packetcrypt_rs.git
cd packetcrypt_rs
cargo build --release
cp target/release/packetcrypt /usr/local/bin/pcm
rm -r $std/packetcrypt_rs

cd $std/pkt-aH
source $std/ENV
sed -i 's|blkpass|'$Blkpass'|g' cfg.toml
sed -i 's|paymakerpass|'$Paymakerpass'|g' cfg.toml    ### why do it in such an inefficient way?
sed -i 's|masterurl|'$Masterurl'|g' cfg.toml        ### cuz I want too...... frick off
sed -i 's|num_workerz|'$NUM_workerz'|g' cfg.toml
sed -i 's|puburl|'$Puburl'|g' cfg.toml

mkdir /etc/pktpool
cp -r $std/pkt-aH /etc/pktpool


