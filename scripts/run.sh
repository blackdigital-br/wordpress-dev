echo ""
echo "#########################################"
echo "#          Starting Services            #"
echo "#########################################"
echo ""

if [ -z "$(ls -A /var/lib/mysql/ 2> /dev/null)" ]; then
    /var/run/imariadb.sh
else
    echo "MariDB is installed"
fi

echo "Starting PHP..."
nohup /usr/sbin/php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.conf > /dev/null 2>&1 &

echo "Starting MariaDB..."
nohup mysqld_safe --defaults-file=/etc/mysql.cnf --user=mysql --port=3306 --silent-startup --log-error=/var/www/logs/mysql.err --socket=/run/mysqld/mysqld.sock > /dev/null 2>&1 &

echo "Starting NGINX..."
nginx -g "daemon off;"