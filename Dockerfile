FROM ruby

Maintainer Jeremiah A. Bohling "jbohling@sycamoreleaf.com"

RUN gem install rails

RUN apt-get -y update && apt-get install -y vim sqlite3 nodejs

COPY bashrc /root/.bashrc

COPY vimrc /root/.vimrc
