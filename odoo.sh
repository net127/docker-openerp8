#!/bin/sh
### In mysqld.sh (make sure this file is chmod +x):
# `/sbin/setuser mysql` runs the given command as the user `mysql`.
# If you omit that part, the command will be run as root.

exec /sbin/setuser mysql /usr/bin/mysqld_safe >>/var/log/mysqld.log 2>&1


#for reference only
[program:odoo]
command=start-stop-daemon --start --quiet --pidfile /var/run/openerp-server.pid --chuid openerp --make-pidfile --exec /odoo/openerp-server -- --config=/etc/openerp/openerp-server.conf --logfile=/var/log/openerp/openerp-server.log
stdout_logfile=/var/log/supervisor/%(program_name)s.log
stderr_logfile=/var/log/supervisor/%(program_name)s.log
stopsignal=6
