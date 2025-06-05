# 使用 Java 运行环境基础镜像
FROM openjdk:17-jdk-slim

# 指定工作目录
WORKDIR /app

# 将 jar 包复制到容器中
COPY mail-backend.jar app.jar

# （可选）复制配置文件
COPY application.yml /app/application.yml

RUN apt-get update && apt-get install -y fontconfig \
&& mkdir /app/auth \
&& chmod 777 ./auth/certification

COPY auth /app/auth

# 暴露端口（Spring Boot 默认是 8080）
EXPOSE 8080

# 容器启动时运行 jar 包
CMD ["java", "-jar", "/app/app.jar"]
# 启动 Jar应用
# ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "app.jar"]
