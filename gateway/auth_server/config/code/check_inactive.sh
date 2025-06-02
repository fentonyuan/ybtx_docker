#!/bin/bash

# 日志输出
echo "$(date): start check" >> /var/log/radacct_cron.log

# 数据库连接信息
DB_HOST="192.168.0.2"  # 或你的MySQL实际IP
DB_PORT="3306"       # 默认3306
DB_USER="radius"
DB_PASS="123456"
DB_NAME="radius"

# 执行SQL语句
mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
UPDATE radacct
SET acctstoptime = NOW()
WHERE acctstoptime IS NULL
  AND TIMESTAMPDIFF(SECOND, acctupdatetime, NOW()) > 120;
EOF

# 日志输出
echo "$(date): end check" >> /var/log/radacct_cron.log
