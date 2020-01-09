# 指定镜像
FROM docker.io/java:8

# 维护者信息
MAINTAINER 1370054591@qq.com

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 在新镜像内部执行的命令，比如安装一些软件、配置一些基础环境，可使用\来换行，当前设置是指定时区,&&支持多命令
RUN mkdir -p /mock-system && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 生成图片路径
RUN mkdir -p /software/fileUploadPath
# 生成日志路径
RUN mkdir -p /software/logs
# 生成文件路径
RUN mkdir -p /software/fileUploadPath/resource

# 设置工作目录
WORKDIR /mock-system

# 设置端口
EXPOSE 8788

# 将文件复制到镜像中
ADD ./target/mock-system.jar  ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar mock-system.jar


