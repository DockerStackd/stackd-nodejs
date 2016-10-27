FROM alpine:3.4

RUN apk upgrade --update && apk add nodejs && \
  apk del curl make gcc g++ python linux-headers paxctl gnupg libgcc libstdc++ && \

  rm -rf /etc/ssl /SHASUMS256.txt.asc /usr/include \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

WORKDIR /var/www/html
VOLUME /var/www/html

EXPOSE 8080

COPY docker-entrypoint.sh /usr/local/bin/
CMD "docker-entrypoint.sh"
