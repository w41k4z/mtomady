# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.2.3
FROM ruby:$RUBY_VERSION-slim AS base

# Rails app lives here
WORKDIR /rails

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl build-essential git cron libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js and npm (for Vue.js build)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Copy application code
COPY . .

RUN npm install
RUN bundle install

# Setup cron job using Whenever
RUN gem install whenever && whenever --update-crontab

CMD ["bash", "-c", "bin/rails db:migrate && bin/rails db:seed && bin/rails server -b 0.0.0.0"]

