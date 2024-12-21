<<<<<<< HEAD
# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy Gemfile into the container (necessary for `bundle install`)
COPY Gemfile ./

# Install bundler and dependencies
RUN gem install bundler:2.3.26 && bundle install

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch"]

=======
FROM bitnami/minideb:latest
Label MAINTAINER Amir Pourmand
RUN apt-get update -y
# add locale
RUN apt-get -y install locales
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# add ruby and jekyll
RUN apt-get install --no-install-recommends ruby-full build-essential zlib1g-dev -y 
RUN apt-get install imagemagick -y 
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/
# ENV GEM_HOME='root/gems' \
#     PATH="root/gems/bin:${PATH}"
RUN gem install jekyll bundler
RUN mkdir /srv/jekyll
ADD Gemfile /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle install
>>>>>>> ae9eae5e0456caa85ba46d5eb58ad14ab7262a76
