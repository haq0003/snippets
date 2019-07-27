#! /bin/bash

TIMESTAMP=$(date +%a)
BACKUP_DIR="XXXXXX"
MYSQL_USER="XXXXXX"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="XXXXXX"
MYSQLDUMP=/usr/bin/mysqldump

$MYSQLDUMP --single-transaction --add-drop-table --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD XXXXXX  $db | gzip > "$BACKUP_DIR/${TIMESTAMP}_XXXXXX.gz"

# Command Direct 
# nice -19 mysqldump --add-drop-table --single-transaction  -u"XXXXXXXXXXXX" -p"XXXXXX" XXXXXX \ 
# | mysql  --max_allowed_packet=500M -h"XXXXXX" -P"XXXXXX" -u"XXXXXX" -p"XXXXXX" 
