#!/bin/bash
# deploy_lamp_stack.sh
# Script to deploy LAMP stack (Linux, Apache, MariaDB, PHP) on Amazon Linux EC2

echo "=== Updating System Packages ==="
sudo yum update -y

echo "=== Installing Apache, MariaDB and PHP ==="
sudo yum install httpd -y
sudo yum install mariadb105-server -y
sudo yum install php8.3-fpm -y

echo "=== Starting Services ==="
sudo systemctl start httpd mariadb php-fpm

echo "=== Checking Service Status ==="
sudo systemctl status httpd mariadb php-fpm --no-pager

echo "=== Enabling Services on Boot ==="
sudo systemctl enable httpd mariadb php-fpm

echo "=== Verifying Installed Packages (Optional) ==="
ls /usr/lib/systemd/system | grep -i <pkg-installed>

echo "=== Create Custom HTML File ==="
sudo vim /var/www/html/index.html

echo "=== Test Apache with curl ==="
curl localhost

echo "=== Create Custom PHP File ==="
sudo vim /var/www/html/index.php

echo "=== Test PHP with curl ==="
curl localhost/index.php

echo "=== Login to MariaDB ==="
sudo mysql

echo "=== After login to MariaDB run following SQL ==="
echo "SHOW DATABASES;"

echo "=== Script Completed ==="
echo "Now open http://<PUBLIC_IP> or http://<PUBLIC_IP>/index.php in your browser to verify"
