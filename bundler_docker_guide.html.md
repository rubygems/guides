---
title: How to use Bundler with Docker
---

# How to use Bundler with Docker

## Introduction

The official Docker images for Ruby assume that you will use only one application, with one Gemfile, and no other gems or Ruby applications will be installed or run in your container.

If you want to install more than one Gemfile in your container, or simply install gems via RubyGems and use them as system gems, this situation is confusing, and has historically led to many confusing errors that appear to be bugs in Bundler.

However, these errors ultimately come from the way the Dockerfile tells Bundler to create [binstubs](https://bundler.io/v1.16/man/bundle-binstubs.1.html) (which are linked to one application and Gemfile) in a single global place for the entire container. If you install two Gemfiles with `rake`, for example, running the `rake` command will always load the last Gemfile that was installed, and never any others.

## Dockerfiles for multiple Ruby applications and gems

To build a Docker container that can run more than one Ruby application or global commands installed with `gem install`, you will need to change some environment variables from the defaults set in the official Docker image for Ruby.

In your Dockerfile, change the `PATH` and `GEM_HOME` so that Bundler will install all gems to the same location, and running commands will use the RubyGems binstubs instead of Bundler's application-locked binstubs:

    ENV GEM_HOME="/usr/local/bundle"
    ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

You will also need to unset `BUNDLE_PATH` and `BUNDLE_BIN`. Unsetting environment variables can be somewhat tricky in Docker, but the most common way is at the beginning of your `ENTRYPOINT` script:

    #!/bin/bash

    unset BUNDLE_PATH
    unset BUNDLE_BIN

    # your script goes here

Once you've done that, you'll be able to run commands without a bundle by calling them directly, like `rake`. You'll be able to run commands in a specific bundle by `cd`ing to that bundle's directory and then using `bundle exec`. For example, to run rake inside your application bundle, you would use `bundle exec rake`.
