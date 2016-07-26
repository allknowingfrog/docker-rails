FROM ruby:2.2.5

Maintainer Jeremiah A. Bohling "jbohling@sycamoreleaf.com"

RUN apt-get -y update && apt-get install -y vim sqlite3

RUN gem install rails
