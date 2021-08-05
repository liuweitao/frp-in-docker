#!/bin/bash
version="0.37.1"

echo "Download ..."
wget https://github.com/fatedier/frp/releases/download/v${version}/frp_${version}_linux_amd64.tar.gz
echo "Unzip ..."
tar -xzf frp_${version}_linux_amd64.tar.gz
mv frp_${version}_linux_amd64 frp
echo "Build Server Image ..."
docker build -f s.dockerfile -t liuweitao/frp-server:${version} .
echo "Build Client Image ..."
docker build -f c.dockerfile -t liuweitao/frp-client:${version} .
echo "Clear files ..."
rm -rf frp.tar.gz frp
echo "Done!!"
docker images
