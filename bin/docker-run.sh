#!/usr/bin/env bash
#初始化目录权限
root_dir=$(cd "$(dirname "$0")"; cd ..; pwd)

#docker数据卷映射到主机的目录
workdir=$HOME

#docker image版本
version=$1
if [ -z $version ];then
    version=v1
fi

# 构建镜像
# sh $root_dir/bin/docker-build.sh $version
# echo "构建image完成"

#docker容器name名称
containerName=$2
if [ -z $containerName ];then
    containerName=lua-study
fi

#停止之前的容器
cnt=`docker container ls -a | grep $containerName | grep -v grep | wc -l`
if [ $cnt -gt 0 ];then
    docker stop $containerName
    docker rm $containerName
fi

#运行容器
docker run -dit --name $containerName lua-dev:$version

echo "docker运行成功!"
echo "开始你的应用lua学习之旅吧!"
echo "run cmd:"

echo "docker exec -it $containerName /bin/sh"
exit 0
