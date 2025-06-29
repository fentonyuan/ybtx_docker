# Dockerfile.base
FROM openjdk:17-jdk-slim

WORKDIR /app

# 更换 apt 源并安装字体
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; \
            s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y fontconfig fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

