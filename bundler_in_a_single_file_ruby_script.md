---
title: How to use Bundler in a single-file Ruby script
---

# How to use Bundler in a single-file Ruby script

To use Bundler in a single-file script, add `require 'bundler/inline'` at the top of your Ruby file. Then, use the `gemfile` method to declare any gem sources and gems that you need. Here's an example:

~~~ ruby
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'json', require: false
  gem 'nap', require: 'rest'
  gem 'cocoapods', '~> 0.34.1'
end

puts 'Gems installed and loaded!'
puts "The nap gem is at version #{REST::VERSION}"
~~~

To run this script, including installing any missing gems, save the script into a file (for example, `bundler_inline_example.rb`) and then run the file with the command `ruby bundler_inline_example.rb`.

Running the script will automatically install any missing gems, require the gems you listed, and then run your code.
