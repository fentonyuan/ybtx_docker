FROM gateway-web-frontend:base

# 拷贝资源文件与配置
COPY config/ /home/

RUN mkdir /home/cloud-frontend \
    && unzip -d /home/cloud-frontend /home/dist.zip \
    && rm -f /home/dist.zip \
    && mv /home/nginx.conf /etc/nginx/nginx.conf \
    && mv /home/static.conf /etc/nginx/conf.d/default.conf \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
