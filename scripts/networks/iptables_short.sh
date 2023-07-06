#!/bin/sh
# Allow SSH on port 4080
iptables -A INPUT -p tcp --dport 4080 -j ACCEPT
# Allow HTTP on port 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
# Allow HTTPS on port 443
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# Drop bad packages
iptables -A INPUT -j DROP
# Display new firewall rules
iptables -L -v | 4080 || echo "[*] Error configuring SSH firewall"
iptables -L -v | 80 || echo "[*] Error configuring HTTP firewall"
iptables -L -v | 443 || echo "[*] Erro configuring HTTPS firewall"
