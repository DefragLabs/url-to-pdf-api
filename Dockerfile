FROM node:9-alpine

RUN apk update && \
    apk upgrade && \
    apk add --update ca-certificates && \
    apk add chromium --update-cache --repository http://nl.alpinelinux.org/alpine/edge/community \
    rm -rf /var/cache/apk/*

RUN mkdir -p /app/url-to-pdf-api

ADD . /app/url-to-pdf-api

WORKDIR /app/url-to-pdf-api

RUN npm install

ENTRYPOINT NODE_ENV=production node src/index.js
