---
layout: post
title: 测试脚本
---
这是一个测试

{% highlight bash %}

#! /bin/sh
echo "Please input title in english"
read titleen
filename=$(date +"%Y-%m-%d")-$titleen.md
echo "Please input title in Chinese"
read titlecn

echo "---" >> _posts/$filename
echo "layout: post" >> _posts/$filename
echo "title: $titlecn" >> _posts/$filename
echo "---" >> _posts/$filename

echo "creat $filename success"
echo "want to write now? (y/n)"

read is

if [ $is = "y" ]; then 
    vim _posts/$filename
fi

{% endhighlight %}