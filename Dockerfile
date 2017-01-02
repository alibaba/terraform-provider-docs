#FROM registry.aliyuncs.com/ubuntu:14.04
FROM ruby:2.3 
ENV GEM_HOME /
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLER_VERSION 1.11.2
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_BIN="$GEM_HOME/bin" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
	&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"
RUN gem install bundler --version "$BUNDLER_VERSION" \
	&& bundle config --global path "$GEM_HOME" \
	&& bundle config --global bin "$GEM_HOME/bin"\
#	&& bundle config mirror.https://rubygems.org https://ruby.taobao.org\
#    && bundle config mirror.http://rubygems.org https://ruby.taobao.org

ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN mkdir -p /usr/src/web
COPY * /usr/src/web/
COPY source /usr/src/web/source
WORKDIR /usr/src/web

RUN gem install rails
RUN gem install middleman
RUN gem install therubyracer
RUN gem install rb-inotify 
RUN gem install middleman-hashicorp  --version "0.3.2"
RUN bundle 
RUN bundle install 

EXPOSE 4567
CMD cd /usr/src/web && bundle exec middleman
# ENTRYPOINT ["bundle","middleman"]