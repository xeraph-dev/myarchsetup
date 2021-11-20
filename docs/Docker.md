# Docker



###### Install

```shell
spmS docker
```



###### Add user to docker group

```shell
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
```



###### Enable services

```shell
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```



###### Download configuration

```
sudo wget -O - https://raw.githubusercontent.com/adrianrl99/myarchsetup/main/etc/docker/daemon.json > /etc/docker/daemon.json
```

