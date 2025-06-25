FROM monitor:base

# 设置工作目录
WORKDIR /app

# 创建运行所需目录
RUN mkdir -p /app/log /app/auth

# 拷贝 jar 和配置
COPY ybtx_monitor.jar /app/app.jar
COPY edge.json /app/config.json
COPY auth/ /app/auth
COPY output/ /app/output

# 配置 eapol_test 可执行权限
RUN chmod +x /app/auth/certification && \
    cp /app/auth/eapol_test /usr/local/bin && \
    chmod +x /usr/local/bin/eapol_test

# 启动命令
CMD ["java", "-jar", "/app/app.jar"]
