# frp-docker
快速生成指定版本的frp服务端和客户端docker镜像

<h1>生成镜像步骤：</h1>
<h6>1、将本项目解压到任意linux目录下；</h6>
<h6>2、脚本文件 build.sh 第三行是frp版本号，5行、7行是运行平台名称，按需修改即可；</h6>
<h6>3、授予执行权限并执行脚本：</h6>
<pre>
chmod +x build.sh
./build.sh
</pre>
<h6>4、脚本执行完毕，会显示当前所有镜像，可以看到多了frp-client和frp-server两个镜像。</h6>

<h1>运行容器：</h1>
<h6>1、服务端：</h6>
<pre>
mkdir /etc/frp #将你的frps.ini文件放置到此目录
docker run --name frps --restart=always -d \
    --network host \
    -v /etc/frp:/etc/frp \
    liuweitao/frp-server:0.41.0-amd64-linux #这一行是镜像名称:tag，如果你前面有修改，这里要对应上
</pre>
<h6>2、客户端：</h6>
<pre>
mkdir /etc/frp #将你的frpc.ini文件放置到此目录
docker run --name frpc --restart=always -d \
    --network host \
    -v /etc/frp:/etc/frp \
    liuweitao/frp-client:0.41.0-amd64-linux #这一行是镜像名称:tag，如果你前面有修改，这里要对应上
</pre>

<h1>了解FRP</h1>
<a href="https://github.com/fatedier/frp" target="_blank">fatedier/frp</a>
