FROM php:8.0.1-fpm


RUN apt-get update && apt-get install -y \
	git \
	curl \
	libpng-dev \
	libonig-dev \
	libxml2-dev \
	zip \
	unzip


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

RUN docker-php-ext-install  pdo_mysql mbstring exif pcntl bcmath gd


WORKDIR /var/www


COPY . .

ENTRYPOINT ["./bash.sh"]
