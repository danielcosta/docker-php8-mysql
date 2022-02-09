FROM daccbr/php8-composer-xdebug as extensions

RUN apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS

RUN docker-php-ext-install pdo_mysql

FROM daccbr/php8-composer-xdebug AS final

COPY --from=extensions /usr/local/lib/php/extensions/no-debug-non-zts-20210902/pdo_mysql.so /usr/local/lib/php/extensions/no-debug-non-zts-20210902/pdo_mysql.so

RUN docker-php-ext-enable pdo_mysql
