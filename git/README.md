Check size :

```
git st -s | awk '{print $2}' | xargs du -h --max-depth=0
git ls-tree -r -t -l --full-name HEAD | sort -n -k 4 |  awk '{print $5}' | xargs du -h --max-depth=0
```

---
/etc/profile
```
# git branch on command prompt
if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\w\[\033[01;35m\]$(parse_git_branch)\[\033[01;34m\] \$ \[\033[00m\]'
else
        PS1='\[\033[01;31m\]\u@\h \[\033[01;00m\]\w\[\033[00;33m\]$(parse_git_branch)\[\033[00m\] \$ '
fi

# Change the window title of X terminals
PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}:$(parse_git_branch)\007"'

alias ll='ls -alt'
```
ARCHIVE :

```
git archive --format zip --output ../XXX.zip HEAD $(git diff --name-only 89cb 6213)
git archive --format zip --output ../XXX.zip HEAD $(git show --pretty="format:" --name-only 9993 9d5e) // liste de release
git archive --format zip --output ../XXX.zip HEAD $(git diff --name-only branch1..branch2)
```
ALIAS :
```
[alias]
   st = status
   co = checkout
   ba = branch -v -a
   nlog = log --name-status
   glog = log --graph --abbrev-commit
   sglog = log --graph --abbrev-commit --pretty=oneline
   slog = log --pretty=oneline --abbrev-commit
   dlog = log -p
   relog = log --graph --abbrev-commit --pretty=oneline --no-merges
   ci = commit -v
   br = branch -v
   ru = remote update
   su = submodule update
   si = submodule init
#Mise en couleur des messages
[color]
    ui = auto
[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
[color "status"]
    added = yellow
    changed = green
    untracked = cyan
[merge]
   summary = true
```
