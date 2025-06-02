# 使用 OpenJDK 11 作为基础镜像
FROM openjdk:11-jre-slim

# 创建工作目录
WORKDIR /app

#创建日志目录 /app/log 
#创建存放日志目录 /app/command 
#创建存放命令下发目录 /app/commands
RUN mkdir /app/log \
&& mkdir /app/command \
&& mkdir /app/cloud_report

# 拷贝 jar 包和配置文件到镜像中
COPY ybtx_monitor.jar /app/app.jar
COPY cloud.json /app/config.json

# 容器启动时运行 jar 包
CMD ["java", "-jar", "/app/app.jar"]