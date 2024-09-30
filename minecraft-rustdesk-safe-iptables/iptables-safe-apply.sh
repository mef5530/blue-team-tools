#!/bin/bash

iptables-save > backup-iptables.rules
iptables-restore < lockdown-iptables.rules
(sleep 300 && iptables-restore < backup-iptables.rules) &

echo "Press enter"
read -t 60 confirm

if [ "$confirm" ]; then
        echo "W!"
        pkill -f "sleep 60"
else
        echo "L! Reverting"
fi
