FROM ruby

MAINTAINER Jeremiah A. Bohling "jbohling@sycamoreleaf.com"

RUN apt-get -y update && apt-get install -y sqlite3 nodejs

RUN gem install rails

RUN apt-get -y update && apt-get install -y vim

COPY bashrc /root/.bashrc

COPY vimrc /root/.vimrc
