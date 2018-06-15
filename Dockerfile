FROM node:8.11-alpine

COPY . /app

WORKDIR /app

RUN apk upgrade --update \
    && apk add bash git ca-certificates \
    && apk add --no-cache --virtual .build-deps wget tar ca-certificates \
    && apk add --no-cache libgcc openssl pcre perl tzdata curl \
    && wget -O /bin/aws-env "https://s3-us-west-2.amazonaws.com/kountable-bin/aws-env/aws-env-linux-amd64" \
    && chmod +x /bin/aws-env \
    && npm install \
    && npm install -g bower \
    && npm install -g grunt-cli \
    && grunt buildProd \
    && npm --unsafe-perm --production install \
    && apk del git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]
