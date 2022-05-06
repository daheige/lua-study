From alpine:3.15

# 解决docker时区问题和中文乱码问题
ENV TZ=Asia/Shanghai LANG="zh_CN.UTF-8" 

# 解决http x509证书问题，需要安装证书
# tsinghua alpine source
RUN echo "export LC_ALL=$LANG"  >>  /etc/profile \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/main/" > /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk --no-cache add tzdata ca-certificates bash vim bash-doc bash-completion curl \
    && apk add lua \
    && ln -snf  /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $HOME/.cache
