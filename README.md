docker-odoo
===============

Docker container for Odoo (OpenERP 8)


To run the container ...

docker run -d -p 8069 -p 8070 quantumobject/docker-odoo
 
check with docker ps the port use for 8069 and point your brownser to location ...and log in with: admin is the password for the master management account please replace it first .... 

you can use docker-bash id-container to access the container by the server that running it ... docker-bash is a tool that you can find at :

https://github.com/QuantumObject/docker-tools
