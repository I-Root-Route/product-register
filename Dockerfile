FROM ruby:2.5
RUN apt update && apt install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/
RUN bundle lock --add-platform x86_64-linux && \
    gem install bundler -v '2.2.17' && \ 
    bundle install
