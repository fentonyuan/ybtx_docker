# 使用 OpenJDK 11 作为基础镜像
FROM openjdk:11-jre-slim

# 创建工作目录
WORKDIR /app

#创建日志目录 /app/log
RUN mkdir /app/log \
&& mkdir /app/auth \
&& mkdir /app/file_buffer \
&& mkdir /app/file_buffer/sender_buffer \
&& mkdir /app/file_buffer/receiver_buffer \
&& mkdir /app/file_buffer/security_store  \
&& mkdir /app/gateway_dependency

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
    alien && \
    apt-get clean

# 可选：如果 libnl-route-3.so 缺失，则添加软链接（按需做）
RUN if [ ! -f /usr/lib/libnl-route-3.so ]; then \
    ln -s /usr/lib/x86_64-linux-gnu/libnl-route-3.so.200 /usr/lib/libnl-route-3.so; \
    fi

# 拷贝 jar 包和配置文件到镜像中
COPY ybtx_monitor.jar /app/app.jar
COPY gateway.json /app/config.json
COPY auth/ /app/auth
COPY gateway_dependency/ /app/gateway_dependency

# 配置 eapol_test 可执行权限
RUN chmod +x /app/auth/certification && \
    cp /app/auth/eapol_test /usr/local/bin && \
    chmod +x /usr/local/bin/eapol_test && \
    chmod 777 ./auth/certification

# 容器启动时运行 jar 包
CMD ["java", "-jar", "/app/app.jar"]