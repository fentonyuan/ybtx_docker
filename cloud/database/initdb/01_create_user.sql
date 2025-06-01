-- 创建数据库
CREATE DATABASE IF NOT EXISTS radius CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS gin_server CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS cloud_monitor CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建用户 test 并设置密码
CREATE USER IF NOT EXISTS 'radius'@'%' IDENTIFIED BY '123456';

-- 授权 test 用户对 radius 数据库的所有操作
GRANT ALL PRIVILEGES ON radius.* TO 'radius'@'%';

-- 刷新权限
FLUSH PRIVILEGES;