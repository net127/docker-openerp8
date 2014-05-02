# openERP 8 container
# VERSION 0.0.5
FROM angelrr7702/docker-ubuntu-14.04-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy-backports main restricted " >> /etc/apt/sources.list
RUN echo "deb http://nightly.openerp.com/trunk/nightly/deb/ ./"  >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN (DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -q )
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes -q supervisor cron sudo
RUN DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 apt-get install -y  --allow-unauthenticated openerp
ADD start.sh /start.sh
RUN chmod 750 /start.sh
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8069 8070
VOLUME ["/var/log/supervisor"]
CMD ["/bin/bash", "-e", "/start.sh"]
