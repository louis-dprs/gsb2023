#!/bin/bash

echo ping s-infra
ping -c3 172.16.0.1

echo ping r-int interface n-infra
ping -c3 172.16.0.254

echo ping r-int interface n-link
ping -c3 192.168.200.254

echo ping r-ext interface n-linkv
ping -c3 192.168.1.1

echo ping r-vp1 interface n-linkv
ping -c3 192.168.1.2

echo ping r-vp2 interface n-ag
ping -c3 172.16.128.254

echo ping s-agence
ping -c3 172.16.128.10
