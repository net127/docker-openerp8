#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
        #openssl req -new -x509 -days 365 -nodes -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN"  -out /etc/apache2/ssl/owncloud.pem -keyout /etc/apache2/ssl/owncloud.key
        #sed -i 's/ServerName example.com/ServerName $CN/' /etc/apache2/conf.d/owncloud.conf
        #to include the domain to the hosts
        #echo 127.0.0.1 $CN >> /etc/hosts
        # for security change permission of folder and files
        #chown -R www-data:www-data /var/www/owncloud
        #find /var/www/owncloud -type d -exec chmod 750 {} \;
        #find /var/www/owncloud -type f -exec chmod 640 {} \;
        
        
        POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin/postgres
        POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf

        sudo -u postgres $POSTGRESQL_BIN --single \
                --config-file=$POSTGRESQL_CONFIG_FILE \
              <<< "UPDATE pg_database SET encoding = pg_char_to_encoding('UTF8') WHERE datname = 'template1'" &>/dev/null
        sudo -u postgres $POSTGRESQL_BIN --single \
                --config-file=$POSTGRESQL_CONFIG_FILE \
                  <<< "CREATE USER openerp WITH SUPERUSER;" &>/dev/null
        sudo -u postgres $POSTGRESQL_BIN --single \
                --config-file=$POSTGRESQL_CONFIG_FILE \
                <<< "ALTER USER openerp WITH PASSWORD 'postgres';" &>/dev/null
  
        adduser --system --quiet --shell=/bin/bash --home=/opt/openerp --gecos 'OpenERP' --group openerp
        sed -i 's/ssl = true/ssl = false/' /etc/postgresql/9.3/main/postgresql.conf
      
        #needed to fix problem with ubuntu ... and cron 
        update-locale
        date > /etc/configured
fi
