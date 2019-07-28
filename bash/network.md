shows the source IP addresses and numbers of the connections:
```
ss -tan state established | grep ":80\|:443" | awk '{print $4}'| cut -d':' -f1 | sort -n | uniq -c | sort -nr
```

Check request :
```
for log in /var/log/apache2/*/logs/*access*log; do echo -n "$log "; tail -n10000 "$log" | grep -c IP.IP.IP.IP; done | sort -n -k2
```

Number of connections in SYN_RECV state (possible syn-flood):
```
ss -tan state syn-recv | wc -l
```

Determine the target IP under attack
```
netstat -lpan | grep SYN_RECV | awk '{print $4}' | cut -d: -f1 | sort | uniq -c | sort -nk 1
```
