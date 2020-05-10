#!/bin/bash

if [ -z ${SERVERNAME+x} ]; then echo "SERVERNAME is unset"; exit 1; fi
echo ServerName $SERVERNAME >> /etc/apache2/apache2.conf

if [ -z ${CLIENTID+x} ]; then echo "CLIENTID is unset"; exit 1; fi
sed -i -e "s#CLIENTID#$CLIENTID#" /etc/apache2/conf-enabled/openidc.conf

if [ -z ${CLIENTSECRET+x} ]; then echo "CLIENTSECRET is unset"; exit 1; fi
sed -i -e "s#CLIENTSECRET#$CLIENTSECRET#" /etc/apache2/conf-enabled/openidc.conf

if [ -z ${REDIRECTURI+x} ]; then echo "REDIRECTURI is unset"; exit 1; fi
sed -i -e "s#REDIRECTURI#$REDIRECTURI#" /etc/apache2/conf-enabled/openidc.conf

if [ -z ${SCOPE+x} ]; then echo "SCOPE is unset"; exit 1; fi
sed -i -e "s#SCOPE#$SCOPE#" /etc/apache2/conf-enabled/openidc.conf

if [ -z ${CRYPTOPASS+x} ]; then echo "CRYPTOPASS is unset"; exit 1; fi
sed -i -e "s#CRYPTOPASS#$CRYPTOPASS#" /etc/apache2/conf-enabled/openidc.conf

if [ "$SERVERNAME" != "localhost.localdomain" ]; then
    if [ -z ${EMAIL+x} ]; then echo "EMAIL is unset"; exit 1; fi
    (sleep 60; certbot --apache --agree-tos -n -m $EMAIL -d $SERVERNAME) &
fi

exec apachectl -D FOREGROUND
