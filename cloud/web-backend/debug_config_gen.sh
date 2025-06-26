#!/bin/bash

# 调试配置生成模块的脚本
# 用于检查容器环境中的路径和权限问题

echo "=== 配置生成模块调试信息 ==="
echo "当前时间: $(date)"
echo "当前用户: $(whoami)"
echo "当前工作目录: $(pwd)"
echo "用户主目录: $HOME"

echo ""
echo "=== 环境变量检查 ==="
echo "CONFIG_GEN_ENABLED: $CONFIG_GEN_ENABLED"
echo "CONFIG_GEN_ENABLE_AUTO_GENERATION: $CONFIG_GEN_ENABLE_AUTO_GENERATION"
echo "CONFIG_GEN_STORAGE_PATH: $CONFIG_GEN_STORAGE_PATH"
echo "CONFIG_GEN_ENABLE_API_TRIGGER: $CONFIG_GEN_ENABLE_API_TRIGGER"
echo "CONFIG_GEN_ENABLE_EVENT_TRIGGER: $CONFIG_GEN_ENABLE_EVENT_TRIGGER"

echo ""
echo "=== 目录状态检查 ==="
echo "检查 /home/gateway_config 目录:"
if [ -d "/home/gateway_config" ]; then
    echo "  目录存在"
    echo "  权限: $(ls -ld /home/gateway_config)"
    echo "  内容: $(ls -la /home/gateway_config 2>/dev/null || echo '目录为空')"
else
    echo "  目录不存在"
fi

echo ""
echo "检查当前目录下的 gateway_config:"
if [ -d "./gateway_config" ]; then
    echo "  目录存在"
    echo "  权限: $(ls -ld ./gateway_config)"
    echo "  内容: $(ls -la ./gateway_config 2>/dev/null || echo '目录为空')"
else
    echo "  目录不存在"
fi

echo ""
echo "检查用户主目录下的 gateway_config:"
if [ -d "$HOME/gateway_config" ]; then
    echo "  目录存在"
    echo "  权限: $(ls -ld $HOME/gateway_config)"
    echo "  内容: $(ls -la $HOME/gateway_config 2>/dev/null || echo '目录为空')"
else
    echo "  目录不存在"
fi

echo ""
echo "=== 权限测试 ==="
echo "测试 /home/gateway_config 写权限:"
if touch /home/gateway_config/test_write 2>/dev/null; then
    echo "  写权限正常"
    rm -f /home/gateway_config/test_write
else
    echo "  写权限失败"
fi

echo ""
echo "测试当前目录下 gateway_config 写权限:"
mkdir -p ./gateway_config
if touch ./gateway_config/test_write 2>/dev/null; then
    echo "  写权限正常"
    rm -f ./gateway_config/test_write
else
    echo "  写权限失败"
fi

echo ""
echo "=== 进程和日志检查 ==="
echo "检查 gin-server 进程:"
ps aux | grep gin-server | grep -v grep || echo "  进程未运行"

echo ""
echo "检查最近的日志文件:"
if [ -d "/home/logs" ]; then
    echo "  /home/logs 目录内容:"
    ls -la /home/logs/ | head -10
    echo ""
    echo "  最新日志文件内容 (最后20行):"
    find /home/logs -name "*.log" -type f -exec ls -t {} + | head -1 | xargs tail -20 2>/dev/null || echo "  无日志文件"
else
    echo "  /home/logs 目录不存在"
fi

echo ""
echo "=== 数据库连接测试 ==="
echo "数据库配置:"
echo "  DB_HOST: $DB_HOST"
echo "  DB_PORT: $DB_PORT"
echo "  DB_USER: $DB_USER"
echo "  DB_NAME: $DB_NAME"

# 如果有mysql客户端，尝试连接测试
if command -v mysql >/dev/null 2>&1; then
    echo "  尝试连接数据库..."
    mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" 2>/dev/null && echo "  数据库连接成功" || echo "  数据库连接失败"
else
    echo "  mysql客户端未安装，跳过连接测试"
fi

echo ""
echo "=== 调试完成 ==="
