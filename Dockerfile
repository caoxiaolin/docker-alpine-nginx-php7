FROM alpine

MAINTAINER caoxiaolin

RUN mkdir -p /run/nginx/ /var/log/supervisord /etc/supervisord \
    && apk add --update supervisor nginx nginx-mod-http-lua php7 php7-fpm php7-mysqli php7-pdo_mysql php7-mbstring php7-json php7-zlib php7-gd php7-curl php7-session php7-opcache php7-redis php7-mcrypt \
    && rm -rf /var/cache/apk/* /tmp/* \
    && chown nginx:nginx /run/nginx/
 
ADD config/supervisord.conf /etc/supervisord.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
