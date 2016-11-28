FROM centos:latest
MAINTAINER Ian McAllister "https://github.com/docker-scientific-python3"

ENV USERID 5000

RUN curl -o /tmp/epel.rpm https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm \
  && rpm -ivh /tmp/epel.rpm \
  && rm -f /tmp/epel.rpm

RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -

RUN yum install -y nodejs --nogpgcheck \
  && yum install -y gfortran lapack atlas python-setuptools gcc gcc-c++ \
  python-devel postgresql git libxml2-devel libpqxx-devel libxslt-devel libjpeg-devel \
  && yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
  && yum install -y python35u python35u-libs python35u-devel python35u-pip

ADD requirements.txt /tmp
RUN pip3.5 install -r /tmp/requirements.txt && rm -f /tmp/requirements.txt