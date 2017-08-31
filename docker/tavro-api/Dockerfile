FROM php:7.1.8-fpm

MAINTAINER jakelitwicki <jake.litwicki@gmail.com>

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl unzip ntp wget snmp build-essential python-software-properties python-pip python2.7 python-mysqldb python-boto libssl-dev libcurl4-openssl-dev pkg-config openssl vim git mysql-client
ADD conf/supervisord.conf /etc/supervisord.conf

# Copy our nginx config
RUN rm -Rf /etc/nginx/nginx.conf
ADD conf/nginx.conf /etc/nginx/nginx.conf

# nginx site conf
RUN mkdir -p /etc/nginx/sites-available/ && \
    mkdir -p /etc/nginx/sites-enabled/ && \
    mkdir -p /etc/nginx/ssl/ && \
    rm -Rf /var/www/* && \
    mkdir /var/www/html/

ADD conf/nginx-site.conf /etc/nginx/sites-available/default.conf
ADD conf/nginx-site-ssl.conf /etc/nginx/sites-available/default-ssl.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Add Scripts
ADD scripts/bootstrap.sh /bootstrap.sh
ADD scripts/letsencrypt-setup /usr/bin/letsencrypt-setup
ADD scripts/letsencrypt-renew /usr/bin/letsencrypt-renew
RUN chmod 755 /usr/bin/letsencrypt-setup && chmod 755 /usr/bin/letsencrypt-renew && chmod 755 /bootstrap.sh

EXPOSE 443 80

CMD ["/bootstrap.sh"]
