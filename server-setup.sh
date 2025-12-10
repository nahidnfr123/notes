#!/bin/bash

# PHP versions installation
sudo apt update

sudo systemctl daemon-reload
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php

sudo apt install unzip curl -y

sudo apt install php8.5 php8.5-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip} -y

sudo apt install php8.4 php8.4-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.3 php8.3-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.2 php8.2-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.1 php8.1-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php7.4 php7.4-{fpm,common,mysql,xml,json,mbstring,gd,curl,bcmath} -y

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

# Laravel Installer
composer global require laravel/installer

# Add Composer to PATH
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

# Redis Setup
sudo apt install redis-server -y
sudo systemctl enable redis-server
sudo systemctl start redis-server
sudo apt install php-redis -y

# Add aliases
echo "alias sail='sh \$([ -f sail ] && echo sail || echo vendor/bin/sail)'" >> ~/.bashrc
echo "alias pa='php artisan'" >> ~/.bashrc
echo "alias pa-mf='php artisan migrate:fresh --seed'" >> ~/.bashrc
source ~/.bashrc
