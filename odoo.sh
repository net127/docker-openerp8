#!/bin/sh
### In odoo.sh (make sure this file is chmod +x):
# `/sbin/setuser openerp` runs the given command as the user `openerp`.
# If you omit that part, the command will be run as root.

exec start-stop-daemon --start --quiet --pidfile /var/run/openerp-server.pid --chuid openerp --make-pidfile --exec /usr/bin/openerp-server -- --config=/etc/odoo/openerp-server.conf --logfile=/var/log/openerp/openerp-server.log >>/var/log/odoo.log 2>&1
