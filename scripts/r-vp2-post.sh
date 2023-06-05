#!/bin/bash
#recuperation du fichier de config
wget http://r-vp1.gsb.adm:8000/wg0-b.conf
#renomage fichier et mv
mv ./wg0-b.conf /etc/wireguard/wg0.conf
#activation interface wg0
systemctl enable wg-quick@wg0 && systemctl start wg-quick@wg0
