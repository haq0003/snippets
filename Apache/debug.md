
```
source /etc/apache2/envvars
echo ${APACHE_LOCK_DIR}
apache2 -M
apache2ctl -M 
apachectl -t -D DUMP_MODULES

cd /var/crash
sudo apport-unpack /var/crash/_usr_sbin_apache2.0.crash _unpacked

gdb $(cat _unpacked/ExecutablePath) _unpacked/CoreDump

netstat -an | egrep ':80|:443' | grep ESTABLISHED | awk '{print $5}' | grep -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort -n | uniq -c | sort -nr
```
