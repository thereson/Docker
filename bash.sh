#!/bin/bash

composer install --no-progress --no-interaction
 

if [ ! -f ".env" ]; then
	cp .evn.example .env
fi


php artisan migrate
php artisan key:generate
php artisan cache:clear

php arisan serve
