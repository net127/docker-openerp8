# openERP 8 container
# VERSION 0.2.1
FROM angelrr7702/docker-ubuntu-14.04-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted " >> /etc/apt/sources.list
RUN echo "deb http://nightly.odoo.com/trunk/nightly/deb/ ./"  >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN (DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -q )
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install postgresql
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes -q supervisor cron sudo
RUN DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 apt-get install -y  --allow-unauthenticated openerp
ADD start.sh /start.sh
RUN chmod 750 /start.sh
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8069 8070
VOLUME ["/var/log/supervisor"]
CMD ["/bin/bash", "-e", "/start.sh"]
