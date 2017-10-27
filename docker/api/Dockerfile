FROM alpine:3.6
LABEL maintainer="Jake Litwicki <jake.litwicki@gmail.com>"

RUN apk add --update --no-cache bash gawk sed grep bc coreutils nginx && \
    rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak

ADD nginx.conf /etc/nginx/
ADD api.conf /etc/nginx/conf.d/api.conf

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk --no-cache add shadow && \
    usermod -u 1000 www-data && \
    chown -R www-data:www-data /var/www

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
