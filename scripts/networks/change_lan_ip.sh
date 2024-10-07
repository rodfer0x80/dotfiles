#!/bin/sh

lan_host_ip="192.168.1.69/24" # cidr ipv4 addresses range for LAN
lan_gateway_ip="192.168.1.254" # router/modem gateway ipv4 addr
#dns_provider_ip="8.8.8.8" # google dns, ISP gateway also as dns
validate_ip() {
    if ! echo "$1" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}(/([0-9]{1,2}))?$'; then
        echo "Error: Invalid IP address format: $1"
        exit 1
    fi
}
validate_ip "$lan_host_ip"
validate_ip "$lan_gateway_ip"
validate_ip "$dns_provider_ip"

con_uuid="$(nmcli -t -f UUID con show | head -n 1)"
if [ -z "$con_uuid" ]; then
    echo "Error: No network connection found."
    exit 1
fi
echo "Modifying connection with UUID: $con_uuid"

nmcli con modify "$con_uuid" ipv4.addresses "$lan_host_ip" 
nmcli con modify "$con_uuid" ipv4.gateway "$lan_gateway_ip" 
#nmcli con modify "$con_uuid" ipv4.dns "$dns_provider_ip"
nmcli con modify "$con_uuid"  ipv4.method manual
if [ $? -eq 0 ]; then
    echo "Connection modified successfully."
else
    echo "Error: Failed to modify the network connection."
    exit 1
fi

nmcli con down "$con_uuid" && nmcli con up "$con_uuid"
if [ $? -eq 0 ]; then
    echo "Connection restarted successfully."
else
    echo "Error: Failed to restart the connection."
    exit 1
fi
