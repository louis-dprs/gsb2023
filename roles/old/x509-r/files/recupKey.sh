#!/bin/bash

REMH=192.168.0.52

cd /etc/ipsec.d  

scp cacerts/strongswanCert.pem root@$REMH:/etc/ipsec.d/cacerts

scp certs/r-vp2Cert.pem root@$REMH:/etc/ipsec.d/certs

scp certs/r-vp1Cert.pem root@$REMH:/etc/ipsec.d/certs

scp private/r-vp2Key.pem root@$REMH:/etc/ipsec.d/private

scp private/r-vp1Key.pem root@$REMH:/etc/ipsec.d/private

