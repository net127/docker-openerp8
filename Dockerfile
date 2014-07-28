# Odoo (openERP 8) container
# VERSION 0.2.1
FROM angelrr7702/docker-ubuntu-14.04-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted " >> /etc/apt/sources.list

RUN (DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -q )
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install postgresql
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes -q supervisor cron sudo
# package required for odoo no repository install dependence 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install git
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install graphviz ghostscript postgresql-client \
python-dateutil python-feedparser python-matplotlib \
python-ldap python-libxslt1 python-lxml python-mako \
python-openid python-psycopg2 python-pybabel python-pychart \
python-pydot python-pyparsing python-reportlab python-simplejson \
python-tz python-vatnumber python-vobject python-webdav \
python-werkzeug python-xlwt python-yaml python-imaging
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install gcc python-dev mc bzr python-setuptools python-babel \
python-feedparser python-reportlab-accel python-zsi python-openssl \
python-egenix-mxdatetime python-jinja2 python-unittest2 python-mock \
python-docutils lptools make python-psutil python-paramiko poppler-utils \
python-pdftools antiword

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q  python-colorama python-distlib python-html5lib python-pip

RUN git clone https://github.com/odoo/odoo.git

RUN mkdir -p /etc/openerp
RUN mkdir -p /var/log/openerp
RUN cp /odoo/debian/openerp.logrotate /etc/logrotate.d/openerp-server
RUN cp /odoo/debian/openerp-server.conf /etc/openerp/openerp-server.conf
RUN echo "addons_path = /odoo/addons" >> /etc/openerp/openerp-server.conf

ADD start.sh /start.sh
RUN chmod 750 /start.sh
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8069 8070
VOLUME ["/var/log/supervisor"]
CMD ["/bin/bash", "-e", "/start.sh"]
