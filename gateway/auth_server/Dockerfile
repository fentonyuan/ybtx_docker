FROM cloud-auth-server:base

COPY config/ /home/

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
    && chmod 777 /home/output/police.json \
    && chmod +x /etc/freeradius/3.0/code/check_inactive.sh \
    && dos2unix /home/startup.sh

# 给启动脚本执行权限
RUN chmod +x /home/startup.sh

EXPOSE 1812/udp 1813/udp 3799/udp

# 使用你提供的启动脚本作为入口
ENTRYPOINT ["/home/startup.sh"]