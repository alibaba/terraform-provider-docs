FROM ruby:2.3
RUN echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db
RUN ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
RUN gem install rails
RUN gem install middleman
RUN mkdir -p /usr/src/web
COPY * /usr/src/web/
WORKDIR /usr/src/web
RUN bundle 
EXPOSE 4567
RUN bundle exec middleman
