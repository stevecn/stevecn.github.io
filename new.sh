#! /bin/sh
echo "Please input title in english"
read titleen
filename=$(date +"%Y-%m-%d")-$titleen.md
echo "Please input title in Chinese"
read titlecn

echo "---" >> _posts/$filename
echo "layout: post" >> _posts/$filename
echo "title: "$titlecn"" >> _posts/$filename
echo "---" >> _posts/$filename

echo "creat $filename success"
echo "want to write now? (y/n)"

read writenow

if [ $writenow = "y" ]; then 
    vim _posts/$filename
fi