FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY config/ /home/

RUN apt-get update && apt-get install -y ca-certificates && \
    sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
        openssl libssl-dev freeradius freeradius-mysql \
        python3 python3-pip mysql-server nano redis cron dos2unix && \
    pip3 install cryptography redis -i https://mirrors.aliyun.com/pypi/simple/

RUN mv /home/clients.conf /etc/freeradius/3.0/clients.conf \
    && mv /home/sql /etc/freeradius/3.0/mods-available/sql \
    && ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled \
    && rm -rf /etc/freeradius/3.0/certs && cp -r /home/certs /etc/freeradius/3.0/ \
    && mv /home/dictionary /etc/freeradius/3.0/dictionary \
    && mv /home/eap /etc/freeradius/3.0/mods-available/eap \
    && mv /home/default /etc/freeradius/3.0/sites-enabled/default \
    && mv /home/coa /etc/freeradius/3.0/sites-available/coa \
    && ln -s /etc/freeradius/3.0/sites-available/coa /etc/freeradius/3.0/sites-enabled/ \
    && mv /home/exec /etc/freeradius/3.0/mods-enabled/exec \
    && mv /home/queries.conf /etc/freeradius/3.0/mods-config/sql/main/mysql/queries.conf \
    && mv -T /home/code /etc/freeradius/3.0/code \
    && mv -T /home/keys /etc/freeradius/3.0/keys

WORKDIR /etc/freeradius/3.0/certs

WORKDIR /etc/freeradius/3.0/certs
RUN chown freerad:freerad dh \
    && chmod 400 dh \
    && chmod 755 server.pem \
    && chmod 755 server.key \
    && chmod 640 ca.pem \
    && chown root:freerad ca.pem


RUN echo "* * * * * /bin/bash /etc/freeradius/3.0/code/check_inactive.sh >> /var/log/radacct_cron.log 2>&1" > /etc/cron.d/radius-cron \
    && chmod 0644 /etc/cron.d/radius-cron \
    && crontab /etc/cron.d/radius-cron \
    && dos2unix /etc/freeradius/3.0/code/check_inactive.sh \
    && dos2unix /etc/freeradius/3.0/code/token.sh \
    && chmod +x /etc/freeradius/3.0/code/token.sh \
    && chmod +x /etc/freeradius/3.0/code/check_inactive.sh

# 设置输出权限
RUN mkdir -p /home/output \
    && chmod 777 /home/output/police.json || true \
    && touch /home/output/token.txt && chown freerad:freerad /home/output/token.txt && chmod 644 /home/output/token.txt

# 启动 redis 和 cron
RUN redis-server /etc/redis/redis.conf --daemonize yes \
    && service cron start

EXPOSE 1812 1813

CMD ["freeradius", "-f", "-X"]
