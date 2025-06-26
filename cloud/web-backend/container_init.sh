#!/bin/bash

# 容器初始化脚本
# 确保所有必要的目录存在并具有正确的权限

set -e  # 遇到错误立即退出

echo "=== 容器初始化开始 ==="

# 检查关键文件是否存在
echo "检查关键文件..."
if [ ! -f "/home/gin-server" ]; then
    echo "错误: /home/gin-server 文件不存在"
    exit 1
fi

if [ ! -x "/home/gin-server" ]; then
    echo "设置 gin-server 可执行权限..."
    chmod +x /home/gin-server
fi

# 创建必要的目录
echo "创建必要的目录..."
mkdir -p /home/logs
mkdir -p /home/regist/certs/certs
mkdir -p /home/regist/certs/keys
mkdir -p /home/gateway_config
mkdir -p /home/configmanager/config_exec/downloads
mkdir -p /home/configmanager/config_exec/decypted
mkdir -p /home/keys/configmanager/log
mkdir -p /home/keys/configmanager/config_exec

# 设置目录权限
echo "设置目录权限..."
chmod -R 755 /home/logs
chmod -R 755 /home/regist
chmod -R 755 /home/gateway_config
chmod -R 755 /home/configmanager
chmod -R 755 /home/keys

# 设置密钥文件权限（如果存在）
if [ -f "/home/keys/key.bin" ]; then
    echo "设置密钥文件权限..."
    chmod 600 /home/keys/key.bin
fi

# 创建测试文件验证权限
echo "验证目录权限..."
test_dirs=(
    "/home/logs"
    "/home/gateway_config"
    "/home/configmanager/config_exec/downloads"
)

for dir in "${test_dirs[@]}"; do
    if touch "$dir/test_write" 2>/dev/null; then
        echo "  $dir - 写权限正常"
        rm -f "$dir/test_write"
    else
        echo "  $dir - 写权限失败"
    fi
done

# 显示环境信息
echo "环境信息:"
echo "  当前用户: $(whoami)"
echo "  当前工作目录: $(pwd)"
echo "  用户主目录: $HOME"
echo "  CONFIG_GEN_STORAGE_PATH: $CONFIG_GEN_STORAGE_PATH"
echo "  gin-server 文件权限: $(ls -la /home/gin-server)"

echo "=== 容器初始化完成 ==="

# 启动应用
echo "启动 gin-server..."
exec /home/gin-server
