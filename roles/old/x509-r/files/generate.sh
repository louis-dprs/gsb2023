#!/bin/bash

cd /etc/ipsec.d  

ipsec pki --gen --type rsa --size 4096 --outform pem > private/strongswanKey.pem  

ipsec pki --self --ca --lifetime 3650 --in private/strongswanKey.pem --type rsa --dn "C=CH, O=GSB, CN=Root CA" --outform pem > cacerts/strongswanCert.pem

ipsec pki --gen --type rsa --size 2048 --outform pem > private/r-vp1Key.pem 

chmod 600 private/r-vp1Key.pem 

ipsec pki --pub --in private/r-vp1Key.pem --type rsa | ipsec pki --issue --lifetime 730 --cacert cacerts/strongswanCert.pem --cakey private/strongswanKey.pem --dn "C=CH, O=GSB, CN=r-vp1" --san r-vp1 --flag serverAuth --flag ikeIntermediate --outform pem > certs/r-vp1Cert.pem    

ipsec pki --gen --type rsa --size 2048 --outform pem > private/r-vp2Key.pem

chmod 600 private/r-vp2Key.pem

ipsec pki --pub --in private/r-vp2Key.pem --type rsa | ipsec pki --issue --lifetime 730 --cacert cacerts/strongswanCert.pem --cakey private/strongswanKey.pem --dn "C=CH, O=GSB, CN=r-vp2" --san r-vp2 --flag serverAuth --flag ikeIntermediate --outform pem > certs/r-vp2Cert.pem