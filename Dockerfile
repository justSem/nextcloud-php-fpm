FROM php:fpm

COPY www.conf /usr/local/etc/

RUN apt update && \
    apt -y upgrade && \
    apt -y install libjpeg62-turbo-dev \
    libfreetype6-dev \
    libpng-dev \
    lbzip2 \
    libxslt1-dev \
    libmcrypt-dev \
    libicu-dev \
    libwebp-dev \
    libmemcached-dev \
    build-essential \
    zlib1g-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) gd \
    && for module in opcache bz2 exif intl mysqli mcrypt pdo_mysql zip sockets xsl pcntl; \
    do docker-php-ext-configure $module; \
    docker-php-ext-install -j$(nproc) $module; \
    done \
    && yes "" | pecl install igbinary \
    && docker-php-ext-enable igbinary \
    && yes "" | pecl install msgpack \
    && docker-php-ext-enable msgpack \
    && yes "" | pecl install memcached \
    && docker-php-ext-enable memcached \
    && yes "" | pecl install mcrypt \
    && docker-php-ext-enable mcrypt \
    && yes "" | pecl install apcu \
    && docker-php-ext-enable apcu \
    && yes "" | pecl install redis \
    && docker-php-ext-enable redis \
    && chown -R daemon:daemon /var/www
