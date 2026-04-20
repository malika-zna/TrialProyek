#!/usr/bin/env bash
set -e

echo "Restoring Odoo dump..."
pg_restore -v --no-owner --role=odoo -U "$POSTGRES_USER" -d odoo /dumps/odoo.dump
echo "Restore done."