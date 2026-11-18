#!/bin/bash
set -e

echo "Iniciando Odoo 20..."
echo "Conectando con PostgreSQL..."

umask 077
printf '[options]\nadmin_passwd = %s\n' "$ODOO_MASTER_PASSWORD" > /tmp/odoo.conf

exec odoo \
    --config=/tmp/odoo.conf \
    --http-interface=0.0.0.0 \
    --http-port="${PORT:-10000}" \
    --db_host="${DB_HOST}" \
    --db_port="${DB_PORT:-5432}" \
    --db_user="${DB_USER}" \
    --db_password="${DB_PASSWORD}" \
    --database="${DB_NAME}" \
    --init=base \
    --proxy-mode \
    --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons


