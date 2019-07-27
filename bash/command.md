Change conf value

```
sudo sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.0/fpm/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.0/fpm/php.ini
```
---

Solarized with Bash-it
And add : apt-get install fonts-powerline

---

```
ionice -c 3 nice -n 19 /usr/bin/rsync -avzKh  --super -og --chown=xxx:xxx  -e "ssh -p 39999" --stats --delete-before --bwlimit=1000   user@xxxxx.fr:/xxxx/web     /var/www/xxxx/.
```

---

Crontab all users :

```
for user in $(getent passwd | cut -f1 -d: ); do echo $user; crontab -u $user -l; done
```

---
