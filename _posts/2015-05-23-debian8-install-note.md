---
layout: post
title: Debian8安装笔记
category: blog
---

用kde live 安装了Debian8（debian-live-8.0.0-amd64-kde-desktop.iso）。

记录一下遇到的问题和解决办法，出现时间不分先后。

U盘启动安装基本系统的时候会提示找不到iwifi固件，据闻是因为iwifi firmware不开源导致的？这个是无线网卡模块的驱动，没有就无法使用无线网卡。
解决方法可以按照提示插入带有缺失文件的U盘或者CD（文件到debian官网即可下载），或者忽略提示在安装完成之后用网线联网在终端中安装iwifi-firmware这个软件包即可
{% highlight bash %}

➜  ~  sudo aptitude install firmware-iwlwifi

{% endhighlight %}

之后还肯呢个会遇到提示grub-pc不能安装的问题，安装的时候联网可以有效解决这个问题。

<!--more-->

安装部分之后就畅通无阻了。

重启进入系统，发现gtk程序界面很是不友好。安装gtk的oxygen主题就好了。
{% highlight bash %}

➜  ~  sudo aptitude install gtk2-engines-oxygen  gtk3-engines-oxygen gtk-theme-switch

{% endhighlight %}
然后在终端运行：gtk-theme-switch2，换到oxygen主题即可。

安装fcitx，
{% highlight bash %}

➜  ~  sudo aptitide install fcitx

{% endhighlight %}

然后运行:
{% highlight bash %}

➜  ~  im-config

{% endhighlight %}
配置fcitx为默认

可能会遇到chromium浏览器输入拼音时候漏字母的问题

这个时候需要设置环境变量

将


    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    

加入到.profile(bash)或者.zprofile(zsh)中重启即可解决

外接显示器的分辨率问题，这里针对1280x1024分辨率，其它类似：

{% highlight bash %}

➜  ~  cvt 1280 1024 60
# 1280x1024 59.89 Hz (CVT 1.31M4) hsync: 63.67 kHz; pclk: 109.00 MHz
Modeline "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync

➜  ~  xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync

➜  ~  xrandr --addmode VGA1 "1280x1024_60.00"

{% endhighlight %}

然后再设置中设置分辨率即可，为了避免每次开机设置，将


    xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync

    xrandr --addmode VGA1 "1280x1024_60.00"
    

加入到~/.profile(bash)或者~/.zprofile(zsh)。
