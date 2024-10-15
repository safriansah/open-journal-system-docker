FROM php:7-apache

# Install necessary system packages and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Enable the extensions (optional, usually automatic)
# RUN docker-php-ext-enable pdo_pgsql pgsql mysqli pdo_mysql

# Ubah pemilik direktori html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html