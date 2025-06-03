FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY config/ /home/

RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; \
             s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y openssl libssl-dev freeradius freeradius-mysql python3 python3-pip nano redis redis-server cron dos2unix\
    && pip3 install cryptography redis -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN mv /home/clients.conf /etc/freeradius/3.0/clients.conf \
    && mv /home/sql /etc/freeradius/3.0/mods-available/sql \
    && ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled \
    && rm -rf /etc/freeradius/3.0/certs && cp -r /home/certs /etc/freeradius/3.0/ \
    && mv /home/dictionary /etc/freeradius/3.0/dictionary \
    && mv /home/eap /etc/freeradius/3.0/mods-available/eap \
    && mv /home/default /etc/freeradius/3.0/sites-enabled/default \
    && mv /home/coa /etc/freeradius/3.0/sites-available/coa \
    && mv /home/exec /etc/freeradius/3.0/mods-enabled/exec \
    && mv /home/queries.conf /etc/freeradius/3.0/mods-config/sql/main/mysql/queries.conf \
    && mv -T /home/code /etc/freeradius/3.0/code \
    && mv -T /home/keys /etc/freeradius/3.0/keys

WORKDIR /etc/freeradius/3.0/certs

RUN chown freerad:freerad /etc/freeradius/3.0/certs/dh \
    && chmod 755 /etc/freeradius/3.0/certs/server.pem \
    && chmod 755 /etc/freeradius/3.0/certs/server.key \
    && chmod 640 /etc/freeradius/3.0/certs/ca.pem \
    && chown root:freerad /etc/freeradius/3.0/certs/ca.pem \
    && ln -s /etc/freeradius/3.0/sites-available/coa /etc/freeradius/3.0/sites-enabled/ \
    && service redis-server start \
    && systemctl start redis \
    && chmod 777 /home/output/police.json \
    && chmod +x /etc/freeradius/3.0/code/check_inactive.sh \
    && dos2unix /etc/freeradius/3.0/code/check_inactive.sh

RUN echo "* * * * * /bin/bash /etc/freeradius/3.0/code/check_inactive.sh >> /var/log/radacct_cron.log 2>&1" > /etc/cron.d/radius-cron \
    && chmod 0644 /etc/cron.d/radius-cron \
    && crontab /etc/cron.d/radius-cron


EXPOSE 1812 1813

CMD ["freeradius", "-f", "-X"]
