# JST
cp /usr/share/zoneinfo/Japan /etc/localtime

# yum update
yum -y update
yum -y install vim curl


# httpd
yum -y install httpd -noplugins
chkconfig httpd on


# for php 5.6
yum -y install epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum -y install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd php-xml php-mysql

# php.ini
cp /etc/php.ini /etc/php.ini.bk
sed -i "s|^;date.timezone =|date.timezone = Asia/Tokyo|" /etc/php.ini

# composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer global require hirak/prestissimo


# mysql 5.6
yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-server
service mysqld start
chkconfig mysqld on


# apache restar
/etc/rc.d/init.d/httpd restart
