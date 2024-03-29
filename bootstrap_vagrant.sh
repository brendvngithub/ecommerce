#!/usr/bin/env bash
echo "Provisioning machine"
export DEBIAN_FRONTEND=noninteractive
echo 'LC_ALL="en_ZA.UTF-8"'  >  /etc/default/locale
# generate the za locale
locale-gen en_ZA.UTF-8
export LANGUAGE=en_ZA.UTF-8
export LANG=en_ZA.UTF-8
dpkg-reconfigure locales

# and timezone
echo 'Africa/Johannesburg'  >  /etc/timezone
dpkg-reconfigure -f noninteractive tzdata


# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Nginx
echo "Installing Nginx"
	apt-get install nginx -y
	apt-get update

#PHP
echo "Installing PHP"
	sudo apt-get install php7.2 php7.2-common php7.2-cli php7.2-fpm php7.2-xdebug -y
	php -v
# php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml -y > /dev/null
	sudo apt-get upgrade

echo "Config PHP Timezone & FPM Fix Path"
echo "date.timezone = UTC" >> /etc/php/7.2/fpm/php.ini
echo "date.timezone = UTC" >> /etc/php/7.2/cli/php.ini
echo "cgi.fix_pathinfo=0" >> /etc/php/7.2/fpm/php.ini

cat << 'XDEBUG_DEVBOX_CONF' > /etc/php/7.2/mods-available/xdebug.ini
zend_extension=xdebug.so
xdebug.remote_enable = 1
xdebug.remote_port = 9000
# xdebug.remote_log = /vagrant/xdebug.log
xdebug.idekey = PHPSTORM
xdebug.show_error_trace = 1
xdebug.remote_autostart = 0
xdebug.file_link_format = phpstorm://open?%f:%l


xdebug.remote_host=10.0.2.2
xdebug.profiler_enable=true
xdebug.profiler_output_dir="/tmp"
XDEBUG_DEVBOX_CONF

    sudo service php7.2-fpm restart

echo "Configuring Nginx"
	sudo cp /var/www/provision/nginx_vhost /etc/nginx/sites-available/nginx_vhost
	sudo ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/    
	sudo rm -rf /etc/nginx/sites-available/default
	sudo rm -rf /etc/nginx/sites-enabled/default
    
	sudo service nginx restart > /dev/null

echo "Preparing Mysql"
	sudo apt-get install software-properties-common
	sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
	sudo sh -c "echo 'deb https://mirrors.evowise.com/mariadb/repo/10.2/ubuntu '$(lsb_release -cs)' main' > /etc/apt/sources.list.d/MariaDB102.list"
	sudo apt-get install php7.2-mysql -y
	sudo apt-get update -y
# Clean up
	cd /vagrant/
	sudo rm -rf html/
	
echo "Finished provisioning."
