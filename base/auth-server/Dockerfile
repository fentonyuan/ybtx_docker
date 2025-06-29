FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y ca-certificates && \
    sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
        openssl libssl-dev freeradius freeradius-mysql \
        python3 python3-pip mysql-server nano redis cron dos2unix net-tools && \
    pip3 install cryptography redis -i https://mirrors.aliyun.com/pypi/simple/ &&\
    pip install redis -i https://mirrors.aliyun.com/pypi/simple/