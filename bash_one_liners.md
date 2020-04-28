

# Change homes for new uid after setting sssd
```
ls -l /home | awk '{print $9}' | xargs -I {}  chown -R {}:{} /home/{}
```
