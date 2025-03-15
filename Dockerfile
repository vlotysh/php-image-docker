FROM php:8.2-fpm
RUN apt-get update && apt-get install -y \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  zip \
  unzip \
  git \
  curl \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install pdo pdo_mysql gd

RUN docker-php-ext-configure pcntl --enable-pcntl \
  && docker-php-ext-install \
    pcntl

WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
CMD ["php-fpm"]
