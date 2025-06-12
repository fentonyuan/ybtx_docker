# 使用基础镜像
FROM openjdk:17-jdk-slim

# 设置工作目录
WORKDIR /app

# 更换 apt 源并安装字体
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; \
            s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y fontconfig fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

# 复制 jar 包和配置文件
COPY mail-backend.jar app.jar
COPY application.yml /app/application.yml

RUN apt-get update && apt-get install -y fontconfig \
&& mkdir /app/auth \
&& chmod 777 ./auth/certification

# 认证配置
COPY auth /app/auth

# 暴露端口
EXPOSE 8080

# 设置启动命令
CMD ["java","-jar", "/app/app.jar"]

