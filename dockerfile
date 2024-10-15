FROM php:7-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libonig-dev \
    libpq-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql pdo_pgsql xml mbstring opcache

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Enable the extensions (optional, usually automatic)
# RUN docker-php-ext-enable pdo_pgsql pgsql mysqli pdo_mysql

# Ubah pemilik direktori html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html