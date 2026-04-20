#!/usr/bin/env bash
set -e

# Buat role + database jika belum ada (aman untuk first run)
psql -v ON_ERROR_STOP=1 --username "$PG_USER" <<-EOSQL
DO \$\$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'odoo') THEN
    CREATE ROLE odoo LOGIN PASSWORD '$PG_PASSWORD';
  END IF;
END
\$\$;

-- Create DB owned by odoo
CREATE DATABASE odoo OWNER odoo;
EOSQL