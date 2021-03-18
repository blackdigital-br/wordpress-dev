export mysqlInstalled=$(apk info | grep mariadb-server)


apt update 
apt install expect mysql mariadb-server -y

echo ""
echo "#########################################"
echo "#          Setting MariaDB              #"
echo "#########################################"
echo ""
#https://gist.github.com/Mins/4602864

/bin/mysqld_safe --defaults-file=/etc/mysql.cnf --skip-grant-tables --log-error=/var/www/logs/mysql.err & myPid=$!
echo "--> Wait 7s to boot up MySQL on pid ${myPid}"
sleep 7

echo "--> Set root password"
expect -f - <<-EOF
  set timeout 10
  spawn mysql_secure_installation
  expect "Enter current password for root (enter for none):"
  send -- "\r"
  expect "Set root password?"
  send -- "y\r"
  expect "New password:"
  send -- "pass_wordpress\r"
  expect "Re-enter new password:"
  send -- "pass_wordpress\r"
  expect "Remove anonymous users?"
  send -- "y\r"
  expect "Disallow root login remotely?"
  send -- "n\r"
  expect "Remove test database and access to it?"
  send -- "y\r"
  expect "Reload privilege tables now?"
  send -- "y\r"
  expect eof
EOF

mysql -u root -ppass_wordpress -e "create database wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'user_wordpress'@'%' IDENTIFIED BY 'pass_wordpress'"

echo "--> Kill MySQL on pid ${myPid}"
kill -9 ${myPid}