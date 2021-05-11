#!/bin/bash
export std="$(pwd)"
cd $std/pkt-aH
source $std/ENV
sed -i 's|blkpass|'$Blkpass'|g' cfg.toml
sed -i 's|paymakerpass|'$Paymakerpass'|g' cfg.toml    ### why do it in such an inefficient way?
sed -i 's|masterurl|'$Masterurl'|g' cfg.toml        ### cuz I want too...... frick off
sed -i 's|num_workerz|'$NUM_workerz'|g' cfg.toml
sed -i 's|puburl|'$Puburl'|g' cfg.toml
