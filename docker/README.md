Install :
```
apt-get install -y python python-pip
pip install docker-compose
pip install --upgrade pip
useradd -m -s /bin/bash XXXXXX
usermod -a -G docker XXXXXX
systemctl restart docker
su - XXXXXX
```
First build : 

```
docker-compose up --force-recreate --build -d
```
---

other Usefull commands : 
```
  docker-compose log
  docker-compose ps
  docker-compose  down
  docker-compose  stop
  docker-compose  kill
  docker-compose  up -d
  docker-compose exec workspace bash
  docker image list
  docker rmi nomimage
  docker system prune -a -f
```


  
