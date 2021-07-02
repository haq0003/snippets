
#PROD web4 -> MMG web7
/var/www/clients/client0/web4/web   /var/www/clients/client0/web7/web    none  rw,user,bind,exec 0 0
/var/log/ispconfig/httpd/m01.XXXXX.com /var/www/clients/client0/web1/log    none    bind,nobootwait    0 0


For  : 
/mnt/www   /var/www    none    rw,user,bind,exec   0   0

With : 
mv /var/www /mnt/.
nano /etc/systemd/system/mnt-www.mount  => Naming important

And 
[Unit]
Description=Mount Volume at boot

[Mount]
What={ PUT blkid disk }  
Where=/mnt/www
Type=ext4
Options=defaults

[Install]
WantedBy=multi-user.target

RUN : 
systemctl daemon-reload
systemctl start mnt-www.mount
systemctl enable mnt-www.mount
