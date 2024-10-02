#!/bin/bash

nft list ruleset > backup-nft.nft
nft -f lockdown-nftables.nft
(sleep 300 & nft -f backup-nft.nft) &
REVERT_PID=$!

echo "type confirm"
read -t 300 confirm

if [ "$confirm" ]; then
  echo "w!"
  kill $REVERT_PID
else
  echo "l!"
fi
