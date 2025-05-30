FROM ubuntu:20.04

# 使用阿里云镜像源，并安装必要的软件包
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y \
        python3 \
        python3-pip \
        nano \
        libdbus-1-3 \
    && pip3 install cryptography pyinstaller

# 复制代码目录到容器中
COPY eapol/ /home/eapol
COPY dist/ /home/dist

# 将 eapol_test 可执行文件放到系统路径
RUN cp /home/eapol/eapol_test /usr/local/bin/ \
    && chmod a+x /usr/local/bin/eapol_test
