# tiny_linux

## [练习0]	问题集锦：

1.eth0启动不了
     裸机8139cp启动不起来，  找不到驱动。。然后insmod /8139cp.ko 手动将8139cp加载进来，但是注意在linux kernel的menuconfig中Enable loadable module support由于要加载8139网卡驱动。

     打开
```
         Symbol: 8139CP [=m]                                                     │  
  │ Type  : tristate                                                        │  
  │ Prompt: RealTek RTL-8139 C+ PCI Fast Ethernet Adapter support           │  
  │   Location:                                                             │  
  │     -> Device Drivers                                                   │  
  │       -> Network device support (NETDEVICES [=y])                       │  
  │         -> Ethernet driver support (ETHERNET [=y])                      │  
  │ (1)       -> Realtek devices (NET_VENDOR_REALTEK [=y])  

```


2.busybox编译出错
     错误如下：
```
     	inetd.c:(.text.unregister_rpc+0x17): undefined reference to `pmap_unset'
	networking/lib.a(inetd.o): In function `register_rpc':
	inetd.c:(.text.register_rpc+0x4e): undefined reference to `pmap_unset'
	inetd.c:(.text.register_rpc+0x75): undefined reference to `pmap_set'
	networking/lib.a(inetd.o): In function `prepare_socket_fd':
	inetd.c:(.text.prepare_socket_fd+0x8a): undefined reference to `bindresvport'

```
     解决办法：
	重新配置 $ make menuconfig
 	Linux System Utilities  --->  [ ]   Support mounting NFS file systems 网络文件系统
 	Networking Utilities  ---> [ ] inetd (Internet 超级服务器 )
	版本较高，默认支持功能较多，去掉编译不过的功能，如上。

     参考：http://blog.csdn.net/speedoniho/article/details/9089449

     待补充～
