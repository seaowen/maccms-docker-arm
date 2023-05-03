FROM php:7-alpine

COPY . /opt
VOLUME /data

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories && \
    apk add --no-cache zip libzip-dev libpng-dev libjpeg-turbo-dev freetype-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-configure zip && \
    docker-php-ext-install zip gd pdo_mysql && \
    chmod +x /opt/maccms && \
    mv /opt/maccms /bin && \
    mv /opt/web/upload /opt/data && \
    ln -s /data/upload /opt/web/upload && \
    sed -i "s/ROOT_PATH . \'..\//'\//g" /opt/web/application/database.php && \
    mv /opt/web/application/extra /opt/data && \
    ln -s /data/extra /opt/web/application/extra && \
    mv /opt/web/static/player /opt/data && \
    ln -s /data/player /opt/web/static/player

WORKDIR /opt/web
EXPOSE 8088

CMD [ "maccms" ]
