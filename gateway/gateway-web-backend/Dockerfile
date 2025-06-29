# Dockerfile (主构建文件)
FROM gateway-web-backend:base

WORKDIR /app

# 复制动态变更的 jar 包和配置
COPY mail-backend.jar app.jar
COPY application.yml /app/application.yml

# 拷贝固定的认证文件
COPY auth /app/auth
RUN chmod 777 ./auth/certification

EXPOSE 8080

CMD ["java", "-Djava.awt.headless=true", "-jar", "/app/app.jar"]
