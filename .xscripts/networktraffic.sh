#!/bin/sh

# Prints out the current up network traffic in MB

UP=''
DOWN=''

get_up_traffic()
{
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    IFACE=$(echo $IFACES | cut -d " " -f3)
 
    NTDIR="/tmp/nttraffic"
    mkdir -p $NTDIR

    TRANSMIT1=$(cat $NTDIR/last_transmit || echo 0)
    if [[ -z $TRANSMIT1 ]];then
        TRANSMIT1=0
    fi
    
    RECEIVE1=$(cat $NTDIR/last_receive || echo 0)
    if [[ -z $RECEIVE1 ]];then
        RECEIVE1=0
    fi
    
    TRANSMIT2=$(ip -s -c link show wlan0 | tail -n 1 | cut -d " " -f7)
    i=7
    while [[ -z "$TRANSMIT2" ]];
    do
        i=$(expr $i + 1)
        TRANSMIT2=$(ip -s -c link show wlan0 | tail -n 1 | cut -d " " -f$i)
    done
    echo $TRANSMIT2 > $NTDIR/last_transmit
   
    RECEIVE2=$(ip -s -c link show wlan0 | tail -n 3 | head -n 1 | cut -d " " -f6)
    ii=6
    while [[ -z "$RECEIVE2" ]];
    do
        ii=$(expr $ii + 1)
        RECEIVE2=$(ip -s -c link show wlan0 | tail -n 3 | head -n 1 | cut -d " " -f$ii)
        #echo $RECEIVE2
    done
    echo $RECEIVE2 > $NTDIR/last_receive
    
    #echo R1$RECEIVE1 R2$RECEIVE2 T1$TRANSMIT1 T2$TRANSMITE2 
    echo "$UP$(expr $(expr $TRANSMIT2 - $TRANSMIT1) / 1000)KB/s  $DOWN$(expr $(expr $RECEIVE2 - $RECEIVE1) / 1000)KB/s"
}

get_up_traffic

