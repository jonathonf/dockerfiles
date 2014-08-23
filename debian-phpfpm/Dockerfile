FROM debian:wheezy
MAINTAINER Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>

ENV DEBIAN_FRONTEND noninteractive

ADD http://http.debian.net/debian/project/trace/ftp-master.debian.org /etc/trace_ftp-master.debian.org
ADD http://security.debian.org/project/trace/security-master.debian.org /etc/trace_security-master.debian.org
ADD http://www.dotdeb.org/dotdeb.gpg /etc/apt/dotdeb.gpg

RUN echo 'deb http://packages.dotdeb.org wheezy all' > /etc/apt/sources.list.d/dotdeb.list && \
    echo 'deb http://packages.dotdeb.org wheezy-php55 all' > /etc/apt/sources.list.d/dotdeb-php5.list && \
    apt-key add /etc/apt/dotdeb.gpg && \
    rm /etc/apt/dotdeb.gpg

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install php5-fpm

RUN sed -i '/daemonize /c daemonize = no' /etc/php5/fpm/php-fpm.conf && \
    sed -i '/^listen /c listen = 0.0.0.0:9000' /etc/php5/fpm/pool.d/www.conf && \
    sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php5/fpm/pool.d/www.conf

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo = 0/' /etc/php5/fpm/php.ini && \
    sed -i 's/zlib.output_compression = Off/zlib.output_compression = On/' /etc/php5/fpm/php.ini && \
    sed -i 's/;zlib.output_compression_level = -1/zlib.output_compression_level = 6/' /etc/php5/fpm/php.ini && \
    sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/fpm/php.ini && \
    sed -i 's/display_errors = On/display_errors = Off/' /etc/php5/fpm/php.ini && \
    sed -i 's/allow_url_include = On/allow_url_include = Off/' /etc/php5/fpm/php.ini && \
    sed -i 's/;date.timezone =/date.timezone = Europe\/London/' /etc/php5/fpm/php.ini

VOLUME /var/www

EXPOSE 9000

CMD ["php5-fpm", "-F"]
