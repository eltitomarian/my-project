FROM alpine:latest

RUN mkdir /app
WORKDIR /app

LABEL maintainer="eltitomarian <inbox.otros@gmail.com>" \
      version="1.0"
