#for reference only
[program:odoo]
command=start-stop-daemon --start --quiet --pidfile /var/run/openerp-server.pid --chuid openerp --make-pidfile --exec /odoo/openerp-server -- --config=/etc/openerp/openerp-server.conf --logfile=/var/log/openerp/openerp-server.log
stdout_logfile=/var/log/supervisor/%(program_name)s.log
stderr_logfile=/var/log/supervisor/%(program_name)s.log
stopsignal=6
