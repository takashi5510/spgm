FROM ruby:2.5.0

ENV APP_ROOT /spgm

RUN apt-get update -qq && apt-get install -y nodejs  build-essential libpq-dev postgresql-client

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

EXPOSE 3000

ADD . $APP_ROOT
#ADD Gemfile ${APP_ROOT}/Gemfile
#ADD Gemfile.lock ${APP_ROOT}/Gemfile.log

RUN bundle install --local --path vendor/bundle
#RUN bundle exec rails db:migrate

#CMD bundle exec rails s -b 0.0.0.0

