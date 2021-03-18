echo ""
echo "#########################################"
echo "#         Getting Wordpress             #"
echo "#########################################"
echo ""

apt update
apt install wget unzip -y
wget https://wordpress.org/latest.zip
unzip latest.zip
cp -rf wordpress/* /var/www/html/

rm latest.zip
rm -r wordpress/

echo ""
echo "#########################################"
echo "#           Clean Wordpress             #"
echo "#########################################"
echo ""

rm /var/www/html/wp-content/plugins/hello.php
rm -rf /var/www/html/wp-content/plugins/akismet/

echo ""
echo "#########################################"
echo "#        Installing Services            #"
echo "#########################################"
echo ""

apt install nano nginx php-fpm php-pdo php-mysqli php-gd php-curl php-xml php-mbstring php-zip php-json php-exif php-dom php-fileinfo php-iconv php-imagick mysql-client php-xdebug -y

rm /etc/nginx/nginx.conf
mv /etc/nginx/nginx.conf.black /etc/nginx/nginx.conf
rm /etc/php7/php-fpm.d/www.conf
mv /etc/php7/php-fpm.d/www.conf.black /etc/php7/php-fpm.d/www.conf
chmod 777 /var/run/run.sh
chmod -R 777 /var/www/
#chown www-data:www-data -R /var/www/
#chown www-data:www-data -R /var/lib/nginx
#chown www-data:www-data -R /var/tmp/nginx

echo ""
echo "#########################################"
echo "#               CLEAN                   #"
echo "#########################################"
echo ""

apt uninstall expect wget

rm /etc/nginx/conf.d/default.conf
rm /install.sh
rm /var/www/html/*.html
rm -f /tmp/config
rm -rf /var/lib/apt/lists/*