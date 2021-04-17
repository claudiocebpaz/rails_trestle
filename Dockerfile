FROM ruby:3.0.0-alpine

ENV BUNDLER_VERSION=2.2.4

RUN apk add --update --no-cache \
  binutils-gold \
  build-base \
  curl \
  file \
  g++ \
  gcc \
  git \
  less \
  libstdc++ \
  libffi-dev \
  libc-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  make \
  netcat-openbsd \
  nodejs \
  openssl \
  pkgconfig \
  postgresql-dev \
  python2 \
  tzdata \
  yarn \
  sqlite-dev

RUN gem install rails

RUN gem install listen puma 
RUN gem install bootsnap

RUN gem install kaminari kaminari-core kaminari-actionview kaminari-activerecord

RUN gem install trestle

RUN gem install webpacker

WORKDIR /app

# COPY Gemfile Gemfile.lock ./

# RUN bundle config build.nokogiri --use-system-libraries

# RUN bundle check || bundle install

# COPY package.json yarn.lock ./

# RUN yarn install --check-files

COPY . ./

CMD ["/bin/sh"]