FROM php:7.1.10-fpm-alpine

MAINTAINER jakelitwicki <jake.litwicki@gmail.com>

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv

RUN echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    echo /etc/apk/respositories \
    apk update \
    apk add --no-cache bash \ 
    wget \ 
    supervisor \ 
    curl \ 
    libcurl \ 
    git \ 
    python \ 
    python-dev \ 
    py-pip \ 
    augeas-dev \ 
    openssl-dev \ 
    ca-certificates \ 
    dialog \ 
    autoconf \ 
    make \ 
    gcc \ 
    musl-dev \ 
    linux-headers \ 
    libmcrypt-dev \ 
    libpng-dev \ 
    icu-dev \ 
    libpq \ 
    libxslt-dev \ 
    libffi-dev \ 
    freetype-dev \ 
    sqlite-dev \ 
    libjpeg-turbo-dev \
    docker-php-ext-configure gd \
      --with-gd \
      --with-freetype-dir=/usr/include/ \
      --with-png-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/ \
    docker-php-ext-install pdo_mysql pdo_sqlite mysqli mcrypt gd exif intl xsl json soap dom zip bcmath opcache \
    pecl install xdebug \
    docker-php-source delete \
    EXPECTED_COMPOSER_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig) \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '${EXPECTED_COMPOSER_SIGNATURE}') { echo 'Composer.phar Installer verified'; } else { echo 'Composer.phar Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    php composer-setup.php --install-dir=/usr/bin --filename=composer \
    php -r "unlink('composer-setup.php');"  \
    pip install -U pip \
    pip install -U certbot \
    mkdir -p /etc/letsencrypt/webrootauth \
    apk del gcc musl-dev linux-headers libffi-dev augeas-dev python-dev make autoconf
#    ln -s /usr/bin/php7 /usr/bin/php

RUN echo 'alias symfony="php bin/console"' >> ~/.bashrc

WORKDIR /var/www/tavro