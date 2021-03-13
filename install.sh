#!/bin/sh

clear

Declined(){
output "SwiftPanel installer declined."
}

output(){
    echo -e '\e[31m'$1'\e[0m';
}

output1(){
    echo -e '\e[32m'$1'\e[0m';
}



RunScript(){

clear

output1 "######################################################################################"

sleep 1

output "# Auto SwiftPanel Installer Script LOADED"

sleep 2

output "# Created by: Enis 'nisyy.' Cakaj"

sleep 2

output "# Project: https://github.com/enisc-al/Auto-SwiftPanel-Installer-Script"

sleep 2

output "# Facebook: https://www.facebook.com/killeri.amxx"

sleep 2

output "# Youtube: https://www.youtube.com/c/enisigaming/"

sleep 1

output1 "######################################################################################"

sleep 1

clear

output 	"<----- Starting Installation ----->"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<------- PHP INSTALLATION -------->"

sleep 2

# php installation

yum install wget sudo unzip nano git -y
yum install php-mysql php-gd php-imap php-ldap php-mbstring php-odbc php-pear php-xml -y
yum install php -y
yum install php-pecl-apc -y
yum install httpd -y
systemctl restart httpd

output 	"<----- PHP INSTALL FINISHED ------>"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<----- DATABASE INSTALLATION ----->"

sleep 2

# database installation

sudo yum -y install epel-release wget subversion git mariadb-server 
service mariadb start

sudo mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('123');FLUSH PRIVILEGES;" 

printf "123\n n\n y\n n\n y\n y\n y\n" | sudo mysql_secure_installation


SQL="CREATE DATABASE gpanel;"
SQL1="CREATE USER 'gpanel'@localhost IDENTIFIED BY 'gpanel1';"
SQL2="GRANT ALL PRIVILEGES ON gpanel.* TO 'gpanel'@localhost;"
SQL3="use gpanel;"
mysql -u root --password=123  <<<$SQL
mysql -u root --password=123  <<<$SQL1
mysql -u root --password=123  <<<$SQL2
mysql -u root --password=123  <<<$SQL3


output 	"<--- DATABASE INSTALL FINISHED --->"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<----- IONCUBE INSTALLATION ------>"

sleep 2


# ioncube loader installation

cd /tmp
rm -rf ioncube_loaders_lin_x86*
wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -zxvf ioncube_loaders_lin_x86-64.tar.gz
cd ioncube/
extension_dir => /usr/lib64/php/modules => /usr/lib64/php/modules
cp /tmp/ioncube/ioncube_loader_lin_5.4.so /usr/lib64/php/modules
echo zend_extension = /usr/lib64/php/modules/ioncube_loader_lin_5.4.so >> /etc/php.ini
systemctl restart httpd


output 	"<--- IONCUBE INSTALL FINISHED ---->"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<------- SSH INSTALLATION -------->"

sleep 2


# ssh installation

cd
yum install gcc php-devel php-pear libssh2 libssh2-devel make -y
yum install make -y
printf "1\n" | pecl install -f ssh2
echo extension=ssh2.so > /etc/php.d/ssh2.ini
systemctl restart httpd


output 	"<----- SSH INSTALL FINISHED ------>"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<----- TEMPLATES INSTALLATION ---->"

sleep 2


# templates installation

cd /var/www/html
git clone https://github.com/enisc-al/Auto-SwiftPanel-Installer-Script.git
cd Auto-SwiftPanel-Installer-Script
cd tmp
mv * /var/www/html
cd ..
rm -rf tmp
rm -rf README.md
cd .. 
rm -rf Auto-SwiftPanel-Installer-Script


output 	"<-- TEMPLATES INSTALL FINISHED --->"

sleep 2

output1 "<--------------------------------->"

sleep 1

output 	"<----- CHANGING PERMISSIONS ------>"

sleep 2


# chmod permissions

cd /var/www/html
chmod -R 777 *

sleep 2

clear 

output1 "######################################################################################"

sleep 2

output "# SwiftPanel Installation finished"

sleep 2

output "# PHP 5.4.16 ................... OK"

sleep 2

output "# MARIADB ...................... OK"

sleep 2

output "# IONCUBE ...................... OK"

sleep 2

output "# SSH .......................... OK"

sleep 2

output "# TEMPLATES .................... OK"

sleep 2

output1 "######################################################################################"

sleep 1

clear

output1 "######################################################################################"

sleep 2

output "# Install your SwiftPanel by opening this link in your browser"

sleep 2

printf 'http://%s/install\n' $( hostname -I )

sleep 2

output "# Mysql password for user root is: 123"

sleep 2

output1 "######################################################################################"

cd

rm -rf Auto-SwiftPanel-Installer-Script

}

output1 "Do you want to start Auto SwiftPanel installer?"
output "[1] Yes."
output "[2] No."
read icmp
case $icmp in
        1) RunScript
        ;;
        2) Declined
        ;;
        *) Declined
        ;;

 esac
