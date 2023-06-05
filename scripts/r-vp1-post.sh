#!/bin/bash
#stoper le fw
systemctl stop ferm
#ouverture du service web pour copie distante
cd /root/confwg/ && python3 -m http.server 8000 &
