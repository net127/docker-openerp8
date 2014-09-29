#!/bin/sh
### In odoo.sh (make sure this file is chmod +x):
# `/sbin/setuser openerp` runs the given command as the user `openerp`.
# If you omit that part, the command will be run as root.

exec /sbin/setuser openerp start-stop-daemon --start --quiet --pidfile /var/run/openerp-server.pid --chuid openerp --make-pidfile --exec /odoo/openerp-server -- --config=/etc/openerp/openerp-server.conf --logfile=/var/log/openerp/openerp-server.log >>/var/log/mysqld.log 2>&1
