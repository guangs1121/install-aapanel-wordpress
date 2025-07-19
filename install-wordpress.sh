#!/bin/bash
set -e
source "$(dirname "$0")/.env"
WEB_ROOT="/www/wwwroot/$DOMAIN_NAME"
mkdir -p "$WEB_ROOT"
MYSQL="/www/server/mysql/bin/mysql -uroot"
$MYSQL -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
$MYSQL -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
$MYSQL -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost';"
$MYSQL -e "FLUSH PRIVILEGES;"
cd "$WEB_ROOT"
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz --strip-components=1
rm latest.tar.gz
chown -R www:www "$WEB_ROOT"
chmod -R 755 "$WEB_ROOT"
echo "✅ WordPress installed in $WEB_ROOT"