docker-odoo
===============

Docker container for Odoo (OpenERP 8)


To run the container ...

docker run -d -p 8069 -p 8070 quantumobject/docker-odoo
 
check with docker ps the port use for 8069 and point your brownser to location ...and log in with: admin is the password for the master management account please replace it first .... 

To access the container from the server that the container is running :

docker exec -it container_id /bin/bash

For more info about odoo (openerp) :

https://www.odoo.com/
