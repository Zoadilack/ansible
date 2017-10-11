FROM nginx

LABEL maintainer="Jake Litwicki <jake.litwicki@gmail.com>"

ADD nginx.conf /etc/nginx/

# Override the default nginx config
ADD symfony.conf /etc/nginx/conf.d/default.conf

RUN sed -i 's/{WEBROOT}/$WEBROOT/g' /etc/nginx/conf.d/default.conf && \
    sed -i 's/{HOSTNAME}/$HOSTNAME/g' /etc/nginx/conf.d/default.conf && \
    sed -i 's/{ENV}/$ENV/g' /etc/nginx/conf.d/default.conf && \
    usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443