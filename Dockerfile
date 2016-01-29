FROM php:5.5-apache

RUN apt-get update
RUN apt-get install -yqq --no-install-recommends \
  libmemcached-dev \
  locales \
  zlib1g-dev \
  && pecl install memcache \
  && echo extension=memcache.so > /usr/local/etc/php/conf.d/memcache.ini \
  && apt-get clean autoclean && apt-get autoremove -y

COPY . /var/www/html

CMD ["/var/www/html/docker/bootstrap.sh"]
