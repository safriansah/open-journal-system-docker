FROM php:7-apache

# Install PostgreSQL and MySQL extensions
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libmysqlclient-dev \
    && docker-php-ext-install pdo_pgsql pgsql mysqli pdo_mysql

# Enable the extensions (optional, usually automatic)
RUN docker-php-ext-enable pdo_pgsql pgsql mysqli pdo_mysql