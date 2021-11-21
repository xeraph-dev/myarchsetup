# Warp

###### Install

```shell
auri cloudflare-warp-bin
```



###### Enable services

```shell
systemctl enable warp-svc.service
systemctl start warp-svc.service
```



###### Register warp

```shell
warp-cli register
```



###### Add excluded hosts

```shell
warp-cli add-excluded-host secure.etecsa.net
warp-cli add-excluded-host www.portal.nauta.cu
warp-cli add-excluded-host repos.uo.edu.cu
```

