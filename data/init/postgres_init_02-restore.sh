#!/usr/bin/env bash
set -euo pipefail

if [ -f /dumps/odoo.sql ]; then
  echo "Found /dumps/odoo.sql — restoring with psql"

  psql -v ON_ERROR_STOP=1 -U odoo -d odoo -f /dumps/odoo.sql
  echo "Restore (sql) done."
  exit 0
fi
