FROM centos:7
MAINTAINER Aaron Baillargeon

ENV insecure_pub https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub

RUN yum update -y
RUN yum install openssh-server -y
RUN /usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''

ADD $insecure_pub /root/.ssh/authorized_keys

#generally run with `docker run -d -p "4022:22"
CMD ["/usr/sbin/sshd", "-D"]