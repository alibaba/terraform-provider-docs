FROM ruby:2.3
RUN gem install middleman
RUN mkdir -p /usr/src/web
COPY * /usr/src/web/
WORKDIR /usr/src/web
RUN bundle 
EXPOSE 4567
RUN bundle exec middleman
