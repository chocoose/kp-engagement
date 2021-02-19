FROM node:15-alpine

RUN apk add --no-cache git
RUN apk add --no-cache --virtual .build-deps alpine-sdk python
RUN apk add --no-cache \
        build-base \
        g++ \
        cairo-dev \
        jpeg-dev \
        pango-dev \
        giflib-dev

# Create app directory
WORKDIR /app

COPY ./package.json /app/
COPY ./yarn.lock /app/
RUN yarn

RUN apk del .build-deps

COPY . /app/

RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000
