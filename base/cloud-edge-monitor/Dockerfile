# 使用 OpenJDK 11 作为基础镜像
FROM openjdk:11-jre-slim

# 使用阿里源加快构建速度
RUN sed -i 's|http://deb.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
    libssl-dev \
    libnl-3-dev \
    libnl-genl-3-dev \
    libnl-route-3-dev \
    pkg-config \
    build-essential \
    mlocate \
    libdbus-glib-1-dev \
    libgtk2.0-dev \
    dbus \
    wget \
    nano \
    alien && \
    apt-get clean

# 可选：如果 libnl-route-3.so 缺失，则添加软链接（按需做）
RUN if [ ! -f /usr/lib/libnl-route-3.so ]; then \
    ln -s /usr/lib/x86_64-linux-gnu/libnl-route-3.so.200 /usr/lib/libnl-route-3.so; \
    fi
