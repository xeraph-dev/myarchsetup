# NvidiaDriver



###### Install

```shell
spmS nvidia nvidia-utils nvidia-settings
```

In a virtual machine, install  `xf86-video-intel mesa` instance of `nvidia` y `nvidia-utils`



###### Configure cool-bits

```
sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration
```

