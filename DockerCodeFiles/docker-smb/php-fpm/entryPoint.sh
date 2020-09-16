#!/bin/sh

cd /var/www/symfony
composer install
php bin/console doctrine:migrations:migrate --no-interaction
cd /etc/php7
php-fpm7 -F
