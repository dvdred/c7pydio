FROM centos:7

MAINTAINER david.rossi@cnr.it version: 0.1

RUN yum clean all && yum update -y && yum -y install epel-release && yum update -y && yum install -y https://download.pydio.com/pub/linux/centos/7/pydio-release-1-1.el7.centos.noarch.rpm && yum update -y && yum install -y pydio-all && yum clean all
#ADD supervisord.conf /etc/supervisor/conf.d/pydio.conf
ENV LANG it_IT.UTF-8  
ENV LANGUAGE it_IT:it
ENV LC_ALL it_IT.UTF-8  

ADD start.sh /bin/start.sh

#ENV DSM_CONFIG /opt/tivoli/tsm/client/ba/bin/dsm.opt

ENTRYPOINT [ "/bin/start.sh", "start" ]

