FROM alpine:3.6
LABEL maintainer="Jake Litwicki <jake.litwicki@gmail.com>"

ENV APP_NAME ${APP_NAME:-tavro}
ENV WEBROOT ${APP_NAME:-/var/www/tavro}
ENV NGINX_PORT ${APP_NAME:-80}
ENV VIRTUAL_HOST ${APP_NAME:-tavro.io}
ENV APP_ENV ${APP_NAME:-dev}

RUN apk add --update --no-cache bash gawk sed grep bc coreutils nginx && \
    rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak

ADD nginx.conf /etc/nginx/
ADD vhost.conf /etc/nginx/conf.d/${APP_NAME}.conf

RUN sed -i -e 's/{HOSTNAME}/${VIRTUAL_HOST}/g' /etc/nginx/conf.d/${APP_NAME}.conf && \
    sed -i -e 's/{WEBROOT}/${WEBROOT}/g' /etc/nginx/conf.d/${APP_NAME}.conf && \
    sed -i -e 's/{APP_ENV}/${APP_ENV}/g' /etc/nginx/conf.d/${APP_NAME}.conf && \
    sed -i -e 's/{NGINX_PORT}/${NGINX_PORT}/g' /etc/nginx/conf.d/${APP_NAME}.conf && \
    sed -i -e 's/{APP_NAME}/${APP_NAME}/g' /etc/nginx/conf.d/${APP_NAME}.conf

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add shadow && \
    usermod -u 1000 www-data && \
    chown -R www-data:www-data /var/www

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
