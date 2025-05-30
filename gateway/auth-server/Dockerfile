FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

COPY config/ /home/

RUN apt-get update \
    && apt-get install -y openssl \
    && apt-get install -y libssl-dev -y \
    && apt-get install -y freeradius \
    && apt-get install -y freeradius-mysql

RUN  mv /home/clients.conf /etc/freeradius/3.0/clients.conf \
    && mv /home/sql /etc/freeradius/3.0/mods-available/sql \
    && ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled \
    && mv /home/ca.cnf /etc/freeradius/3.0/certs/ca.cnf \
    && mv /home/server.cnf /etc/freeradius/3.0/certs/server.cnf \
    && mv /home/client.cnf  /etc/freeradius/3.0/certs/client.cnf \
    && mv /home/eap /etc/freeradius/3.0/mods-available/eap

WORKDIR /etc/freeradius/3.0/certs
RUN make all \
&& openssl dhparam -check -text -5 512 -out /etc/freeradius/3.0/certs/dh \
&& dd if=/dev/urandom of=random count=2 \
&& chown freerad:freerad /etc/freeradius/3.0/certs/dh \
&& chmod 400 /etc/freeradius/3.0/certs/dh \
&& chmod 755 /etc/freeradius/3.0/certs/server.pem \
&& chmod 755 /etc/freeradius/3.0/certs/server.key \
&& chmod 640 /etc/freeradius/3.0/certs/ca.pem \
&& chown root:freerad /etc/freeradius/3.0/certs/ca.pem

CMD ["freeradius", "-Xf"]
EXPOSE 1812 1813
