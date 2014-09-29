docker-odoo
===============

Docker container for Odoo (OpenERP 8)


To run the container ...

docker run -d -p 8069 -p 8070 quantumobject/docker-odoo

check port and point your brownser to location ...and log in with: admin admin create a new database for each company or entity ... please replace password ..

note: still try to make to work .... no ready for use at the moment ...
note: OpenERP8 Don't have any modules ... but you can add them by "you must put them in a directory (eg /opt/openerp/addons) that the openerp user and/or group has permission to read and write to and update the addon_path in the config file."


I will wait for that odoo finish to move from openerp ...
