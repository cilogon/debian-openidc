FROM debian
EXPOSE 80 443
RUN apt-get update && apt-get install -y \
    apache2 \
    certbot \
    libapache2-mod-auth-openidc \
    libapache2-mod-php \
    python-certbot-apache \
  && rm -rf /var/lib/apt/lists/*
RUN a2enmod ssl && a2ensite default-ssl
RUN mkdir -p /var/www/html/oidc/redirect
COPY index.php /var/www/html/oidc/index.php
COPY openidc.conf /etc/apache2/conf-enabled/openidc.conf
COPY debian-openidc.sh /usr/local/bin
ENTRYPOINT ["debian-openidc.sh"]
