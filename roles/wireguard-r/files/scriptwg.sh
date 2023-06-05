#!/bin/bash
set -u
set -e
# Version Site to Site 
 
AddressAwg=10.0.0.1/32  # Adresse VPN Wireguard cote A
EndpointA=192.168.0.51  # Adresse extremite A
PortA=51820  # Port ecoute extremite A
NetworkA=192.168.1.0/24 # reseau cote A
 
AddressBwg=10.0.0.2/32  # Adresse VPN Wireguard cote B
EndpointB=192.168.0.52 # Adresse extremite B
PortB=51820  # Port ecoute extremite B
NetworkB=172.16.128.0/24 # reseau cote B
 
umask 077
wg genkey > endpoint-a.key
wg pubkey < endpoint-a.key > endpoint-a.pub
 
wg genkey > endpoint-b.key
wg pubkey < endpoint-b.key > endpoint-b.pub
 
 
PKA=$(cat endpoint-a.key)
pKA=$(cat endpoint-a.pub)
PKB=$(cat endpoint-b.key)
pKB=$(cat endpoint-b.pub)
 
cat <<FINI > wg0-a.conf
# local settings for Endpoint A
[Interface]
PrivateKey = $PKA
Address = $AddressAwg
ListenPort = $PortA
 
# IP forwarding
PreUp = sysctl -w net.ipv4.ip_forward=1
 
# remote settings for Endpoint B
[Peer]
PublicKey = $pKB
Endpoint = ${EndpointB}:$PortB
AllowedIPs = $AddressBwg, $NetworkB
 
FINI
 
 
cat <<FINI > wg0-b.conf
# local settings for Endpoint B
[Interface]
PrivateKey = $PKB
Address = $AddressBwg
ListenPort = $PortB
 
# IP forwarding
PreUp = sysctl -w net.ipv4.ip_forward=1
 
# remote settings for Endpoint A
[Peer]
PublicKey = $pKA
Endpoint = ${EndpointA}:$PortA
AllowedIPs = $AddressAwg, $NetworkA
 
FINI
 
echo "wg0-a.conf et wg0-b.conf sont generes ..."
echo "copier wg0-b.conf sur la machine b et renommer les fichiers de configuration ..."
