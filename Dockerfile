FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client 
RUN mkdir /message-me
WORKDIR /message-me
COPY Gemfile /message-me/Gemfile
COPY Gemfile.lock /message-me/Gemfile.lock
RUN bundle install
COPY . /message-me

# Add a scrit to be executed every time the container starts
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
