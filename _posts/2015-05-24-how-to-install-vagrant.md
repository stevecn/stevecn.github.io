---
layout: post
title: Vagrant（Homestead）虚拟机安装和配置
category: blog
---
由于安装已经过去几天，且没有做笔记，以下内容稍有混乱，见谅。
本次安装配置在debian8 kde下进行。

Homestead是laravel针对自身的一个虚拟机环境，集成了框架所需的web软件，也可以用于部署本地php开发环境。用时打开，不用关闭，不必每时每刻占用物理机资源。

Homestead包含了以下软件：

  
    Ubuntu 14.04
    PHP 5.6
    HHVM
    Nginx
    MySQL
    Postgres
    Node (With Bower, Grunt, and Gulp)
    Redis
    Memcached
    Beanstalkd
    Laravel Envoy
    Blackfire Profiler
  

由于mirrors中的virtualbox版本不能正确配置vagrant（依赖需要>=4.3.18-dfsg-3+deb8u1)，所以需要在官网中安装。

<!--more-->

首先按照[virtualbox wiki](https://www.virtualbox.org/wiki/Linux_Downloads)中”Debian-based Linux distributions“下的内容在debian下将virtualbox安装好。
安装完成之后需要在/etc/modules中添加以下modules:
  
    vboxdrv
    vboxnettadp
    vboxnetflt
  
重启电脑或者手动把modules加载一下

{% highlight bash %}

$ sudo modprobe vboxdrv
$ sudo modprobe vboxnettadp
$ sudo modprobe vboxnetflt

{% endhighlight %}

如果出现启动问题，那么需要在BIOS中设置打开虚拟化（根据机型不同方法也不尽相同）。

>上述步骤是为了防止出现以下错误信息:

> * vagrand up default: Warning: Connection timeout. Retrying..
> * VBoxManage: error: Failed to create the host-only adapter VBoxManage: error: VBoxNetAdpCtl: Error while adding new interface: failed to open /dev/vboxnetctl: No such file or directory
> * 私以为如果是在源码中安装是不用配置这些东西的？

接着按照Homestead手册一步一步来即可：
{% highlight bash %}

$ vagrant box add laravel/homestead

{% endhighlight %}

由于.box文件比较大，可以从网站上下载好了之后从本地添加。[下载地址](https://atlas.hashicorp.com/laravel/boxes/homestead)

{% highlight bash %}

$ vagrant box add laravel/homestead ~/yourpath

{% endhighlight %}

将Homestead clone到你的项目目录,并且初始化Homestead。假定此处为是~/Code/myproject

{% highlight bash %}

$ cd /Code/myporject
$ git clone https://github.com/laravel/homestead.git Homestead
$ cd Homestead && bash init.sh

{% endhighlight %}

初始化之后，在~/.homestead/就会出现Homestead的配置文件Homestead.yaml

{% highlight bash %}

---
ip: "192.168.10.10" //虚拟机IP地址
memory: 2048	//虚拟机内存
cpus: 1		//虚拟机cpu数量
provider: virtualbox

authorize: ~/.ssh/id_rsa.pub //ssh key

keys:
    - ~/.ssh/id_rsa

folders: //共享目录
    - map: ~/Code
      to: /home/vagrant/Code

sites:  //共享目录下的虚拟机地址，可以设置sites
    - map: laravel.dev  //绑定域名
      to: /home/vagrant/Code/myproject/   //绑定网站根目录

databases: //数据库名称，密码为secret
    - homestead

variables:
    - key: APP_ENV
      value: local

# blackfire:
#     - id: foo
#       token: bar
#       client-id: foo
#       client-token: bar

# ports:
#     - send: 93000
#       to: 9300
#     - send: 7777
#       to: 777
#       protocol: udp

{% endhighlight %}

配置好之后在Homestead目录下执行

{% highlight bash %}

$ vagrant up

{% endhighlight %}

脚本就会帮你自动配置一个vagrant虚拟机，包含了上述所说的服务器环境。最后将域名(e.g. laravel.dev）添加到host文件中

{% highlight bash %}

$ sudo echo "192.168.10.10 laravel.dev" >> /etc/hosts

{% endhighlight %}

在浏览器中输入http://laravel.dev即可访问。

数据库名称默认为homestead，密码为secret。

常用的vagrant命令：

{% highlight bash %}

$ vagrant init  # 初始化
$ vagrant up  # 启动虚拟机
$ vagrant halt  # 关闭虚拟机
$ vagrant reload  # 重启虚拟机
$ vagrant ssh  # SSH 至虚拟机
$ vagrant status  # 查看虚拟机运行状态
$ vagrant destroy  # 销毁当前虚拟机

{% endhighlight %}



