FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY config/ /home/

RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g; s|http://security.ubuntu.com/ubuntu|http://mirrors.aliyun.com/ubuntu|g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y openssl libssl-dev freeradius freeradius-mysql python3 python3-pip nano \
    && pip3 install cryptography

RUN mv /home/clients.conf /etc/freeradius/3.0/clients.conf \
    && mv /home/sql /etc/freeradius/3.0/mods-available/sql \
    && ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled \
    && mv /home/ca.cnf /etc/freeradius/3.0/certs/ca.cnf \
    && mv /home/server.cnf /etc/freeradius/3.0/certs/server.cnf \
    && mv /home/client.cnf /etc/freeradius/3.0/certs/client.cnf \
    && mv /home/dictionary /etc/freeradius/3.0/dictionary \
    && mv /home/eap /etc/freeradius/3.0/mods-available/eap \
    && mv /home/default /etc/freeradius/3.0/sites-enabled/default \
    && mv /home/coa /etc/freeradius/3.0/sites-available/coa \
    && mv /home/exec /etc/freeradius/3.0/mods-enabled/exec \
    && mv /home/queries.conf /etc/freeradius/3.0/mods-config/sql/main/mysql/queries.conf \
    && mv -T /home/code /etc/freeradius/3.0/code \
    && mv -T /home/keys /etc/freeradius/3.0/keys

WORKDIR /etc/freeradius/3.0/certs

RUN make all \
    && openssl dhparam -check -text -5 512 -out /etc/freeradius/3.0/certs/dh \
    && dd if=/dev/urandom of=random count=2 \
    && chown freerad:freerad /etc/freeradius/3.0/certs/dh \
    && chmod 400 /etc/freeradius/3.0/certs/dh \
    && chmod 755 /etc/freeradius/3.0/certs/server.pem \
    && chmod 755 /etc/freeradius/3.0/certs/server.key \
    && chmod 640 /etc/freeradius/3.0/certs/ca.pem \
    && chown root:freerad /etc/freeradius/3.0/certs/ca.pem \
    && ln -s /etc/freeradius/3.0/sites-available/coa /etc/freeradius/3.0/sites-enabled/

EXPOSE 1812 1813

CMD ["freeradius", "-f", "-X"]
