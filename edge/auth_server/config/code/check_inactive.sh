#!/bin/bash
echo "$(date): start check" >> /var/log/radacct_cron.log

DB_USER="radius"
DB_PASS="radius123456."
DB_NAME="radius"

mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
UPDATE radacct
SET acctstoptime = NOW()
WHERE acctstoptime IS NULL
  AND TIMESTAMPDIFF(SECOND, acctupdatetime, NOW()) > 120;
EOF

echo "$(date): end check" >> /var/log/radacct_cron.log
