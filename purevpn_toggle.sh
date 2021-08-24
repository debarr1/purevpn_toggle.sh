#!/usr/bin/env bash

# To login with details if they are forgotten
#purevpn --login

# Show locations
#purevpn --location

# Logout
#purevpn --logout

echo "$(date) - starting $(purevpn -v)"
purevpn --info
purevpn --status

if [ "$(purevpn -s | grep -c Connected)" -eq 1 ]; then
    echo "You are connected, so you will now be disconnected"
    sleep 4
    purevpn --disconnect
    purevpn --info
elif [ "$(purevpn -s | grep -c Connected)" -eq 0 ]; then
    echo "You are not connected, so you will be connected"
    echo "Killswitch is $(purevpn -k ON)"
    sleep 4
    purevpn --connect "France"
    purevpn --info
fi

$SHELL
