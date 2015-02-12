FROM ubuntu
MAINTAINER Jerome Riga <jriga@zemis.co.uk>

RUN apt-get update && apt-get install -y \
    software-properties-common

RUN apt-add-repository ppa:brightbox/ruby-ng

RUN apt-get update && apt-get install -y \
    ruby2.2-dev ruby2.2 git build-essential

RUN git clone https://jriga@bitbucket.org/jriga/prime-multiplication-table.git
RUN gem install bundler --no-rdoc --no-ri 

WORKDIR prime-multiplication-table

RUN bundle install

ENTRYPOINT ruby lib/core.rb
