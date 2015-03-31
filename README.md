# docker-odoo

Docker container for [Odoo (OpenERP 8)][3]

"Odoo is the fastest evolving business software in the world. Odoo has a complete suite of business applications covering all business needs, from Website/Ecommerce down to manufacturing, inventory and accounting, all seamlessly integrated. It is the first time ever a software editor managed to reach such a functional coverage."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 8069 -p 8070 quantumobject/docker-odoo
 
## Accessing the Odoo applications:

After that check with your browser at addresses plus the port assigined by docker for port 8069:

  - **http://host_ip:port/**
 
Them you can log-in admin/admin for the master management account. Please change the password.   

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash

## More Info

About Odoo [www.odoo.com][1]

To help improve this container [quantumobject/docker-odoo][5]

[1]:https://www.odoo.com
[2]:https://www.docker.com
[3]:https://www.odoo.com/blog/odoo-news-5/post/odoo-8-is-here-181
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-odoo
