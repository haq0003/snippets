With git-ftp :
    Edit .git/config
    RUN git ftp push -s "preprod"

```
[git-ftp "preprod"]
  url = ftp://ftp.cluster020.hosting.ovh.net/www
  user = XXXXXXX
  password = XXXXXXXX

[http]
  sslVerify = false
```

---
With lftp 
For reverse DEST TO SRC add option "mirror -R"

```
lftp 
-e "set ftp:ssl-allow no;set ftp:port-ipv4;set ftp:passive-mode off; mirror  FOLDER_SRC FOLDER_DEST; exit; " 
-u'XXXXXXXXX','XXXXXXXXX' IP.255.255.255

```

