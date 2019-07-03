FROM php:7.2-apache

WORKDIR /root
RUN apt-get update && apt-get install --no-install-recommends -y libgcrypt11-dev zlib1g-dev git-core libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make
RUN git clone --recursive https://github.com/vysheng/tg.git

RUN cd /root/tg && ./configure --disable-openssl && make

WORKDIR /var/www/html

COPY app/ /var/www/html