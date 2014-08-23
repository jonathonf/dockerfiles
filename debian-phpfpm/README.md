# PHP-FPM on Debian Wheezy

A docker container to provide PHP-FPM. This uses the DotDeb packages to provide PHP 5.5.

    docker build -t jonathonf/debian-phpfpm .
    docker run --name fpm -v $HOME/www:/var/www/php jonathonf/debian-phpfpm

By default the container will bind to `0.0.0.0:9000` to enable linking to other containers. There is no need to expose this port; the container is designed to take advantage of Docker's `--link` function.

An example of using this is via a Hiawatha container:

    docker run -P --name web --link fpm:fpm -v $HOME/www:/var/www -v $HOME/log:/var/log/hiawatha jonathonf/hiawatha

Note the use of `--link` which provides PHP support for the web server container.