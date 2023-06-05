#!/bin/bash
echo ping vers r-int
ping -c3 172.16.0.254

echo ping  r-int interface externe
ping -c3 192.168.200.254

echo ping  r-ext interface interne
ping -c3 192.168.200.253

echo ping  r-ext interface liaison
ping -c3 192.168.1.1

echo ping  r-vp1 interface liaison  n-linkv
ping -c3 192.168.1.2

echo ping  r-vp2 interface interface interne
ping -c3 172.16.128.254

echo ping  s-agence
ping -c3 172.16.128.11
