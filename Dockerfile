FROM ruby:2.5

RUN apt-get update -y && apt-get install -y gnupg2

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

RUN gem update --system

RUN gem install rails

RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc

RUN echo "export PS1='\[\e[0;32m\]\u@\h:\[\e[0;36m\]\w\[\e[0m\]$ '" >> /root/.bashrc

CMD ["bash"]
