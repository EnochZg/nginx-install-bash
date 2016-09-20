#!/bin/bash

nginx_version="nginx-1.11.4.tar.gz"

if [ -n "$1" ] 
then 
    echo "cd $1"
    cd "$1"
fi

echo "nginx download path : "$1

echo "start download nginx ..."

if [ ! -f "$nginx_version" ]
then 
    wget http://nginx.org/download/"$nginx_version" 
fi

echo "download finished"

#depress nginx tar
nginx_dir=${nginx_version/.tar.gz/""}/
if [ ! -d "$nginx_dir" ]
then
    tar -zxvf $nginx_version
fi
echo "cd $nginx_dir"
cd $nginx_dir

#install extension
sudo apt-get install libpcre3 libpcre3-dev zlib1g-dev -y

#./configure --prefix=/usr/local/nginx/
make && sudo make install

if [ ! -n "/usr/local/nginx/sbin/nginx" ]
then
    sudo ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
fi
sudo nginx

nginx -h

echo "nginx is starting, enjoy it."


