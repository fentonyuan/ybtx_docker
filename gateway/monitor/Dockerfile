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

# 拷贝 jar 包和配置文件到镜像中
COPY ybtx_monitor.jar /app/app.jar
COPY gateway.json /app/config.json
COPY auth/ /app/auth
COPY gateway_dependency/ /app/gateway_dependency

RUN chmod 777 ./auth/certification

# 容器启动时运行 jar 包
CMD ["java", "-jar", "/app/app.jar"]