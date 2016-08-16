FROM ruby

MAINTAINER Jeremiah A. Bohling "jbohling@sycamoreleaf.com"

RUN gem install rails

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get -y update && apt-get install -y vim sqlite3 nodejs

COPY bashrc /root/.bashrc

COPY vimrc /root/.vimrc
