1/ update /etc/jailkit/lk_init.ini with 
```

[php]
comment = the php interpreter and libraries
executables = /usr/bin/php
directories = /etc/php/7.2, /usr/share/php, /usr/share/php7.2-common, /usr/share/php7.2-gd, /usr/share/php7.2-intl, /usr/share/php7.2-mbstring, /usr/share/php7.2-opcache, /usr/share/php7.2-readline, /usr/share/php7.2-soap, /usr/share/php7.2-tidy, /usr/share/php7.2-xmlrpc, /usr/share/php7.2-bz2, /usr/share/php7.2-curl, /usr/share/php7.2-imap, /usr/share/php7.2-json, /usr/share/php7.2-mysql, /usr/sharephp7.2-recode, /usr/share/php7.2-sqlite3, /usr/share/php7.2-common, /usr/share/php7.2-xml, /usr/share/php7.2-zip, /usr/share/php7.3-mbstring, [B]/usr/share/zoneinfo[/B]
includesections = env

[openssl]
comment = The openssl libraries and programms. [excluded: /etc/ssl/private, /usr/lib/ssl/private]
paths = /etc/ssl/openssl.cnf, /usr/bin/c_rehash, /usr/bin/openssl, /usr/lib/ssl/certs, /usr/lib/ssl/misc, /usr/lib/ssl/openssl.cnf, /usr/share/doc/openssl, /usr/share/man/man*/*ssl.gz
includesections = perl

[env]
comment = environment variables
executables = /usr/bin/env

[editors]
comment = vim, joe and nano
executables = /usr/bin/nano, /usr/bin/vi, /usr/bin/vim
regularfiles = /etc/vimrc

[rsync]
executables = /usr/bin/rsync
includesections = netbasics, uidbasics

[scp]
comment = ssh secure copy
executables = /usr/bin/scp
includesections = netbasics, uidbasics
devices = /dev/urandom

[git]
comment = Fast Version Control System
executables = /usr/bin/git*
directories = /usr/share/git-core
includesections = editors
```

RUN : 

```
jk_init -c /etc/jailkit/jk_init.ini -f -k -j /var/www/clients/clientXX/webXX php openssl env editors rsync scp git
```

CHECK :
```
grep jk_ /var/log/*
```



