#!/usr/bin/env bash
set -e

if [ ! -f /dumps/odoo.sql ]; then
  echo "WARNING: /dumps/odoo.sql not found, skipping restore."
  exit 0
fi

echo "Restoring Odoo SQL..."
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d odoo < /dumps/odoo.sql
echo "Restore done."