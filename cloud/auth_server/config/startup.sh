#!/bin/bash
# 启动 Redis
redis-server /etc/redis/redis.conf --daemonize yes
# 启动 cron
service cron start
# 启动 FreeRADIUS
exec freeradius -f -X
