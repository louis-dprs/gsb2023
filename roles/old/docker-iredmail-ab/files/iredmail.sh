#!/bin/bash

docker run --privileged -p 80:80 -p 443:443 \
	   -h s-mess.sio.lan \
           -e "DOMAIN=sio.lan" \
           -e "MYSQL_ROOT_PASSWORD=iredmail" \
           -e "SOGO_WORKERS=1" \
           -e "TIMEZONE=Europe/Paris" \
           -e "POSTMASTER_PASSWORD=Azertyuiop1+" \
           -e "IREDAPD_PLUGINS=['reject_null_sender', 'reject_sender_login_mismatch', 'greylisting', 'throttle', 'amavisd_wblist', 'sql_alias_access_policy']" \
           -v /root/mysql:/var/lib/mysql \
           -v /root/vmail:/var/vmail \
           -v /root/clamav:/var/lib/clamav \
           --name=iredmail lejmr/iredmail:mysql-latest
