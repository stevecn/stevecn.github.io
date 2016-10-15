#! /bin/sh
echo "Please input title in english"
read titleen
filename=$(date +"%Y-%m-%d")-$titleen.md
echo "Please input title in Chinese"
read titlecn
echo "Please input category"
read category

echo "---" >> _posts/$filename
echo "layout: post" >> _posts/$filename
echo "title: "$titlecn"" >> _posts/$filename
echo "category: "$category"" >> _posts/$filename
echo "---" >> _posts/$filename

echo "creat $filename success"
echo "want to write now? (y/n)"

read writenow

if [ $writenow = "y" ]; then 
    gvim _posts/$filename
fi
