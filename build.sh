#!/bin/bash

version="0.39.0"
#os:darwin|freebsd|linux|windows
os="linux"
#cpu:386|amd64|arm|arm64|mips|mips64|mips64le|misple
cpu="amd64"

echo "Download ..."
wget https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_${os}_${cpu}.tar.gz
echo "Unzip ..."
tar -xzf frp_${version}_${os}_${cpu}.tar.gz
mv frp_${version}_${os}_${cpu} frp
echo "Build Server Image ..."
docker build -f s.dockerfile -t liuweitao/frp-server:${version}-${cpu}-${os} .
echo "Build Client Image ..."
docker build -f c.dockerfile -t liuweitao/frp-client:${version}-${cpu}-${os} .
echo "Clear files ..."
rm -rf frp.tar.gz frp
echo "Done!!"
docker images
