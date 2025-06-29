#!/bin/bash

# Docker 调试脚本
# 用于诊断和解决 Docker 容器启动问题

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Docker 容器调试工具 ===${NC}"

# 检查必要文件
echo -e "${YELLOW}1. 检查必要文件是否存在...${NC}"
files_to_check=(
    "container_init.sh"
    "gin-server"
    "debug_config_gen.sh"
    "keys/key.bin"
    "config/sources.list"
)

for file in "${files_to_check[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓ $file 存在${NC}"
        # 检查文件权限
        if [ -x "$file" ] && [[ "$file" == *.sh ]] || [[ "$file" == "gin-server" ]]; then
            echo -e "${GREEN}  ✓ $file 具有可执行权限${NC}"
        elif [[ "$file" == *.sh ]] || [[ "$file" == "gin-server" ]]; then
            echo -e "${YELLOW}  ! $file 缺少可执行权限${NC}"
        fi
    else
        echo -e "${RED}✗ $file 不存在${NC}"
    fi
done

# 检查文件行结束符
echo -e "${YELLOW}2. 检查脚本文件行结束符...${NC}"
script_files=("container_init.sh" "debug_config_gen.sh")
for script in "${script_files[@]}"; do
    if [ -f "$script" ]; then
        if file "$script" | grep -q "CRLF"; then
            echo -e "${YELLOW}  ! $script 使用 Windows 行结束符 (CRLF)${NC}"
            echo -e "${BLUE}    修复命令: sed -i 's/\r$//' $script${NC}"
        else
            echo -e "${GREEN}  ✓ $script 使用正确的行结束符${NC}"
        fi
    fi
done

# 检查 Docker 镜像
echo -e "${YELLOW}3. 检查 Docker 镜像...${NC}"
if docker images | grep -q "cloud-web-base"; then
    echo -e "${GREEN}✓ cloud-web-base 基础镜像存在${NC}"
else
    echo -e "${RED}✗ cloud-web-base 基础镜像不存在${NC}"
    echo -e "${BLUE}  请先构建基础镜像或修改 Dockerfile 使用其他基础镜像${NC}"
fi

# 构建镜像
echo -e "${YELLOW}4. 构建 Docker 镜像...${NC}"
echo -e "${BLUE}执行命令: docker build -t cloud-web-backend .${NC}"

if docker build -t cloud-web-backend .; then
    echo -e "${GREEN}✓ 镜像构建成功${NC}"
else
    echo -e "${RED}✗ 镜像构建失败${NC}"
    exit 1
fi

# 测试容器启动
echo -e "${YELLOW}5. 测试容器启动...${NC}"
echo -e "${BLUE}执行命令: docker run --rm --name test-container cloud-web-backend${NC}"

# 启动容器并显示日志
if docker run --rm --name test-container cloud-web-backend; then
    echo -e "${GREEN}✓ 容器启动成功${NC}"
else
    echo -e "${RED}✗ 容器启动失败${NC}"
    echo -e "${YELLOW}查看容器日志...${NC}"
    docker logs test-container 2>&1 || true
fi

echo -e "${BLUE}=== 调试完成 ===${NC}"
