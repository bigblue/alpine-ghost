FROM mhart/alpine-node:0.10
MAINTAINER Michael Vigor <michael@bigbluedev.com>

RUN addgroup user && adduser -D -h /home/user -G user user

ENV GHOST_SOURCE /usr/src/ghost
WORKDIR $GHOST_SOURCE

ENV GHOST_CONTENT /var/lib/ghost
RUN mkdir -p "$GHOST_CONTENT" && chown -R user:user "$GHOST_CONTENT"
VOLUME $GHOST_CONTENT

RUN apk add --no-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ \
      --virtual=build-dependencies wget ca-certificates gosu && \
    wget http://ghost.org/zip/ghost-0.7.8.zip && \
    unzip ghost-0.7.8.zip && \
    npm install --production && \
    npm install modclean && \
    ./node_modules/.bin/modclean -r -n safe && \
    npm prune --production && \
    npm cache clean && \
    rm ghost-0.7.8.zip && \
    rm -rf /tmp/npm*

COPY docker-entrypoint.sh /entrypoint.sh
COPY config.example.js config.example.js

RUN chown -R user $GHOST_SOURCE/content

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 2368
CMD ["npm", "start"]
