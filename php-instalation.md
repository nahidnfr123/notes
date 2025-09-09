# php versions installation
sudo apt update

sudo systemctl daemon-reload
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php

sudo apt install unzip curl -y

sudo apt install php8.4 php8.4-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.3 php8.3-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.2 php8.2-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php8.1 php8.1-{fpm,mysql,common,mbstring,xml,gd,cli,bz2,curl,bcmath,intl,zip,opcache} -y

sudo apt install php7.4 php7.4-{fpm,common,mysql,xml,json,mbstring,gd,curl,bcmath} -y


composer global require laravel/installer

# Laravel Command not found fix:
sudo nano ~/.bashrc
# paste:
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
source ~/.bashrc

# REDIS SETUP
# Redis
sudo apt install redis-server -y
sudo systemctl enable redis-server
sudo systemctl start redis-server
sudo apt install php-redis -y

# use predis in project
composer require predis/predis

# env
# If you want Predis (default with redis-server):
REDIS_CLIENT=predis
# If you want PhpRedis (with php-redis extension i.e. fast):
REDIS_CLIENT=phpredis
# ***


# CREATE Alias For Command
-> alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
-> alias pa='php artisan'
-> alias pa-mf='php artisan migrate:fresh --seed'
