#!/bin/bash
export std="$(pwd)"
ufw allow 60000:61000/udp
apt-get install -y mosh
rm -r /usr/local/bin/pcm /root/packetcrypt_rs
git clone -b develop https://github.com/cjdelisle/packetcrypt_rs.git
cd packetcrypt_rs
cargo build --release
cp target/release/packetcrypt /usr/local/bin/pcm

cd $std/pkt-aH
source $std/ENV
sed -i 's/"//\blkpass/\\"/$BLKpass/g' cfg.toml
sed -i 's/"//\paymakerpass/\\"/$Paymakerpass/g' cfg.toml    ### why do it in such an inefficient way?
sed -i 's/"//\masterurl/\\"/$pepehands/g' cfg.toml        ### cuz I want too...... frick off
sed -i 's/"//\num_workers/\\"/$WICKED/g' cfg.toml
sed -i 's/"//\puburl/\\"/$forsenCD/g' cfg.toml
