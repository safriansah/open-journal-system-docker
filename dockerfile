FROM php:7-apache

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo_pgsql pgsql

# Enable the extension (optional, usually automatic)
RUN docker-php-ext-enable pdo_pgsql pgsql