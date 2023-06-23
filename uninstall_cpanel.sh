#!/bin/bash

# Stop related services
for service in cpanel cpdavd exim dovecot cphulkd mysql nsd tailwatchd tomcat; do
    /etc/init.d/${service} stop
done

# Remove directories
for directory in /usr/local/cpanel /var/cpanel /usr/local/cpaddons /usr/local/directadmin /usr/local/license /usr/local/etc/entropyhelp /root/.cpanel /root/cpaneld /etc/chkserv.d; do
    rm -rf ${directory}
done

# Removing cPanel related files
for file in /usr/local/cpanel* /usr/local/cp /var/log/chkservd* /usr/share/locale/locale.alias /etc/sysconfig/network-scripts/ifcfg-venet0:cp1 /usr/lib/locale /usr/lib/libfreebl3.so /usr/lib/libfreebl3.chk /var/lib/mysql /etc/valiases /etc/vfilters /etc/exim* /etc/proftpd /etc/pure-ftpd /etc/ssl /etc/logrotate.d /etc/cron.daily /etc/cron.hourly /etc/cron.d; do
    rm -rf ${file}
done

# Removing cPanel users
for i in $(awk '!/nobody/{print $1}' /etc/userdomains | sort | uniq); do
    userdel $i
done

# Removing cPanel related cron jobs
for i in $(cat /etc/cron*/* | grep '/usr/local/cpanel/bin/' | awk '{print $1}'); do
    crontab -l | grep -v $i | crontab -
done

# Removing Apache
yum remove httpd -y || dnf remove httpd -y

