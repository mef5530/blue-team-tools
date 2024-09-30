#!/bin/bash

iptables-save > backup-iptables.rules
iptables-restore < lockdown-iptables.rules
(sleep 300 && iptables-restore < backup-iptables.rules) &

echo "type confirm"
read -t 300 confirm

if [ "$confirm" ]; then
        echo "W!"
        pkill -f "sleep 300"
else
        echo "L! Reverting"
fi
