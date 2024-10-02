#!/bin/bash

nft list ruleset > backup-nft.nft
nft -f lockdown-nftables.nft
(sleep 300 & nft -f backup-nft.nft) &

echo "type confirm"
read -t 300 confirm

if [ "$confirm" ]; then
  echo "w!"
  pkill -f "sleep 300"
else
  echo "l!"
fi
