# 创造tomcat环境  docker镜像 Alpine docker镜像精简版
FROM tomcat:8.5-jre8-alpine
# 维护者
MAINTAINER "chenwt <feiniaoying@163.com>"

# 设置时区为东八区，并清除tomcat工作目录
# ADD /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

RUN echo 'Asia/Shanghai' >/etc/timezone \
&& rm -rf /usr/local/tomcat/webapps/ 

# 复制war到镜像
ADD admin-fast.war /usr/local/tomcat/webapps/ROOT.war

VOLUME /app

# 切换工作目录
WORKDIR /usr/local/tomcat/webapps/

#启动tomcat shell执行程序
CMD ["catalina.sh", "run"]
EXPOSE 8080
