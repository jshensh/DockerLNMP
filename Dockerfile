FROM centos:7
MAINTAINER John Shen <admin@imjs.work>

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum -y update; yum clean all
RUN yum -y install wget; yum clean all

VOLUME ["/usr/local/mariadb/var/","/home/wwwroot"]
EXPOSE 80

RUN cd ~ && wget http://hk43.server.idc.wiki/lnmp1.2-full.tar.gz?t=`date +%s` -O lnmp1.2-full.tar.gz
ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
