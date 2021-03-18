FROM alpine
VOLUME ["/var/www/logs/", "/var/www/nginx/", "/var/www/cache/", "/etc/mysql", "/var/lib/mysql"]
WORKDIR "/var/www/html/"

COPY [ "scripts/install-alpine.sh", "/install.sh"]
COPY [ "scripts/nginx.conf", "/etc/nginx/nginx.conf.black"]
COPY [ "scripts/run.sh", "/var/run/run.sh"]
COPY [ "scripts/site.conf", "/var/www/nginx/site.conf" ]
COPY [ "scripts/wp-config.php", "/var/www/html/wp-config.php" ]
COPY [ "scripts/www.conf", "/etc/php7/php-fpm.d/www.conf.black" ]
COPY [ "scripts/mysql.cnf", "/etc/mysql.cnf"]
COPY [ "scripts/mariadb-alpine.sh", "/var/run/imariadb.sh"]

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

RUN /install.sh

EXPOSE 80 3306

#COPY [ "scripts/xdebug.ini", "/etc/php/7.4/mods-available/xdebug.ini"]

CMD [ "/bin/sh", "/var/run/run.sh" ]