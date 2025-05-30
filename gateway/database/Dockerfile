FROM mysql:8.0.41

# 设置 root 用户密码（MySQL 默认要求）
ENV MYSQL_ROOT_PASSWORD=123456

# 初始化 SQL 文件自动加载
COPY initdb/ /docker-entrypoint-initdb.d/

EXPOSE 3306