echo ""
echo "#########################################"
echo "#          Installing MariaDB           #"
echo "#########################################"
echo ""

#https://github.com/jbergstroem/mariadb-alpine

apk update
apk add mariadb --no-cache

touch /usr/share/mariadb/mysql_test_db.sql
sed -i -e 's/127.0.0.1/%/' /usr/share/mariadb/mysql_system_tables_data.sql
mkdir /run/mysqld
chown mysql:mysql /etc/my.cnf.d/ /run/mysqld /usr/share/mariadb/mysql_system_tables_data.sql

echo "set password for 'root'@'%' = PASSWORD('pass_wordpress');" >> /tmp/init
/usr/bin/mysql_install_db --user=mysql --cross-bootstrap --rpm --auth-root-authentication-method=normal --skip-test-db --datadir=/var/lib/mysql

echo "create database if not exists \`wordpress\` character set 'utf8'; " >> /tmp/init
echo "grant all on \`wordpress\`.* to 'user_wordpress'@'%' identified by 'pass_wordpress'; " >> /tmp/init
echo "flush privileges;" >> /tmp/init

mysqld --user=mysql --silent-startup --skip-networking --socket=/run/mysqld/mysqld.sock > /dev/null 2>&1 & PID="$!"
sleep 1

eval "mysql" < /tmp/init

kill -s TERM "${PID}"
sleep 1

chown -R mysql:mysql /var/lib/mysql

rm -f /tmp/config
rm -rf /var/cache/apk/*