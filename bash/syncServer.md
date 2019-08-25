With git-ftp :
- Edit .git/config
- RUN git ftp push -s "preprod"
- WITH on remote :
    .git-ftp.log => LAST SHA LOG IN GIT HEAD
    .git-ftp-ignore


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
Other options : --exclude cache/*  --verbose

```
lftp 
-e "set ftp:ssl-allow no;set ftp:port-ipv4;set ftp:passive-mode off; mirror  FOLDER_SRC FOLDER_DEST; exit; " 
-u'XXXXXXXXX','XXXXXXXXX' IP.255.255.255

```
---
With scp
```
scp -r -P port  user@host:remote_path/. .
```
---
With rsync
```
rsync -avzKh -e "ssh -p {{PORT}}" --stats --delete-before --exclude 'sites/*/files' --exclude 'sites/*/private' --exclude '*.sql' --exclude 'ftp' /var/www/XXXX {{USER}}@{{HOST}}:/var/www/public/.
```
