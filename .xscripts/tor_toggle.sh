#!/bin/sh

status=$(sudo systemctl is-active tor.service)
if [ "$status" = "inactive" ]; then
    sudo systemctl start tor.service
else
    sudo systemctl stop tor.service
fi

