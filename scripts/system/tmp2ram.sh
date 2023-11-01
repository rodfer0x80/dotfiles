#!/bin/sh
CAP=4
echo -e "\n# /tmp to RAM\ntmpfs /tmp tmpfs defaults,noatime,nosuid,nodev,mode=1777,size='$CAP'G 0 0" >> /etc/fstab 

