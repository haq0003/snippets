Check size :

```
git st -s | awk '{print $2}' | xargs du -h --max-depth=0
git ls-tree -r -t -l --full-name HEAD | sort -n -k 4 |  awk '{print $5}' | xargs du -h --max-depth=0
```

---
