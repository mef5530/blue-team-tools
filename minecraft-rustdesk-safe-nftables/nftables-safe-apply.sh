#!/bin/bash

nft list ruleset > backup-nft.nft
nft -f lockdown-nftables.nft
(sleep 60 && nft flush ruleset && nft -f backup-nft.nft) &
REVERT_PID=$!

echo "type confirm"
read -t 60 confirm

if [ "$confirm" ]; then
  echo "w!"
  kill $REVERT_PID
else
  echo "l!"
fi
