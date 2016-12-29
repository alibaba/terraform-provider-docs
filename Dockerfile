FROM ruby:2.3
RUN gem install middleman
COPY /* /usr/src/web
WORKDIR /usr/src/web
RUN bundle 
EXPOSE 4567
RUN bundle exec middleman
