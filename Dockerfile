FROM centos:centos6

MAINTAINER kenjiskywalker "https://github.com/kenjiskywalker/docker-centos-ruby-sqlite"

ENV RUBY_VERSION 2.1.3

### Packages
RUN yum groupinstall -y "Development tools"
RUN yum install -y openssl openssl-devel readline-devel readline compat-readline5 libxml2-devel libxslt-devel libyaml-devel git

### Install Ruby
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/stable/ruby-$RUBY_VERSION.tar.gz
RUN tar zvxf ruby-$RUBY_VERSION.tar.gz
RUN cd ruby-$RUBY_VERSION && ./configure && make && make install

### Install bundler
RUN gem update --system
RUN gem install bundler --no-rdoc --no-ri

# Install sqlite
RUN yum install -y sqlite sqlite-devel
