FROM ubuntu:14.04
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN (apt-get -y update; \
     apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties libffi-dev wget; \
     cd /var/tmp; \
     mkdir build; \
     cd build; \
     wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz; \
     tar -xvzf ruby-2.2.0.tar.gz; \
     cd ruby-2.2.0; \
     ./configure; \
     make; \
     make install; \
     echo "gem: --no-ri --no-rdoc" >> ~/.gemrc; \
     gem install bundler; \
     apt-get autoremove -y; \
     apt-get clean -y; \
     rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*; \
     rm -rf /usr/local/lib/ruby/gems/2.2.0/cache/*; \
     rm -rf /var/tmp/*)



