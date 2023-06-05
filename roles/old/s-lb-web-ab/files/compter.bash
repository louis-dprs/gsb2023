#!/bin/bash

echo "" > /var/log/apache2/access.log
watch -n 0 wc -l /var/log/apache2/access.log
