#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y nano git openjdk-7-jdk openjdk-7-jre-headless

cd /usr/local
mkdir tomcat8
groupadd tomcat
useradd -g tomcat -d ./tomcat8 tomcat
usermod -G www-data tomcat
chown tomcat:tomcat ./tomcat8 -R
wget http://apache.mesi.com.ar/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz
tar -xzvf apache-tomcat-8.5.24.tar.gz
ln -s apache-tomcat-8.5.24 tomcat

cp /vagrant/tomcat8 /etc/init.d/tomcat8
chmod 755 /etc/init.d/tomcat8
update-rc.d tomcat8 defaults
service tomcat8 start
