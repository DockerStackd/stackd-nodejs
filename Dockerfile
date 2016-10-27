FROM alpine:3.4

RUN apk upgrade --update && apk add nodejs && \
  npm install -g npm && \
  apk del curl make gcc g++ python linux-headers paxctl gnupg libgcc libstdc++ && \

  rm -rf /etc/ssl /SHASUMS256.txt.asc /usr/include \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

# Create work dir
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www

WORKDIR /var/www/html
VOLUME /var/www/html
EXPOSE 8080

# Init www-data user
USER www-data
RUN composer global require hirak/prestissimo:^0.3 --optimize-autoloader && \
    rm -rf ~/.composer/.cache

USER root
COPY docker-entrypoint.sh /usr/local/bin/
CMD "docker-entrypoint.sh"
