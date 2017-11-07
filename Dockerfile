FROM ruby:2.4

RUN gem install rails

RUN apt-get -y update && apt-get install -y nodejs

RUN gem install mailcatcher

RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc

RUN echo "export PS1='\[\e[0;32m\]\u@\h:\[\e[0;36m\]\w\[\e[0m\]$ '" >> /root/.bashrc

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

VOLUME /var/www/html

RUN git clone https://github.com/vishnubob/wait-for-it && \
    mv wait-for-it/wait-for-it.sh /usr/local/bin/wait-for-it

COPY dockerup.sh /usr/local/bin/dockerup

RUN chmod +x /usr/local/bin/dockerup

COPY Gemfile /var/www/html/Gemfile

COPY Gemfile.lock /var/www/html/Gemfile.lock

RUN bundle install
