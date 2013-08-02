FROM ubuntu:precise
MAINTAINER Peter Baumgartner "pete@lincolnloop.com"

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y salt-minion
