FROM centos:7

MAINTAINER david.rossi@cnr.it version: 0.2

RUN yum clean all && yum update -y && yum -y install epel-release && yum update -y && yum install -y https://download.pydio.com/pub/linux/centos/7/pydio-release-1-1.el7.centos.noarch.rpm && yum update -y && yum install -y pydio-all mod_ssl && yum clean all
ENV LANG it_IT.UTF-8  
ENV LANGUAGE it_IT:it

ADD start.sh /bin/start.sh
ADD mkcert.sh /bin/mkcert.sh

ENTRYPOINT [ "/bin/start.sh", "start" ]

