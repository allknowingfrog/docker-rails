FROM ruby

MAINTAINER Jeremiah A. Bohling "jbohling@sycamoreleaf.com"

RUN gem install rails

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get -y update && apt-get install -y vim sqlite3 nodejs openssh-server

RUN mkdir /var/run/sshd && \
    echo 'root:guest' | chpasswd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY bashrc /root/.bashrc

COPY vimrc /root/.vimrc

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
