#/bin/bash
#编译golang可执行文件
root_dir=$(cd "$(dirname "$0")"; cd ..; pwd)

#docker image版本
version=$1
if [ -z $version ];then
    version=v1
fi

cnt=`docker image ls | grep "lua-dev:$version" | wc -l`
if [ $cnt -gt 0 ];then
    #删除之前的image
    docker rmi -f lua-dev:$version
fi

#重新生成镜像
cd $root_dir
docker build -t lua-dev:$version .

echo "构建image lua-dev:$version 成功"

exit 0
