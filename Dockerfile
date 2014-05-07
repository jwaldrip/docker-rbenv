FROM itriage/base
MAINTAINER Jason Waldrip <jason@waldrip.net>

# Install deps
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y build-essential subversion autoconf libpq-dev libsqlite3-dev libmysqlclient-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git  $HOME/.rbenv
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

# Install plugins
RUN git clone https://github.com/sstephenson/ruby-build.git $(rbenv root)/plugins/ruby-build
RUN $(rbenv root)/plugins/ruby-build/install.sh
RUN git clone https://github.com/jwaldrip/rbenv-setup.git $(rbenv root)/plugins/setup
