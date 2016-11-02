---
layout: post
title: "How to stop cursor from blinking in tty"
---
{% highlight bash %}
~$ echo 0 > /sys/class/graphics/fbcon/cursor_blink
{% endhighlight %}
Put it in the machine startup script like /etc/init.d/rc.local to autoload.
