FROM ubuntu:20.04

# 替换 apt 源
COPY config/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    nginx \
    fonts-dejavu-core \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
