#!/bin/sh

# Prints if the tor service is enabled or not
# Requires tor

TOR_ENABLED=''
TOR_DISABLED=''

get_tor()
{
        status=$(systemctl is-active tor.service)

        if [ "$status" == "active" ]
        then
            echo "$TOR_ENABLED"
        else
 	    :
            echo "$TOR_DISABLED"
        fi

}

get_tor
