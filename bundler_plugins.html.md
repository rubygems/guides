---
title: How to write a Bundler plugin
---

# How to write a Bundler plugin
<a name="how-to-write-a-bundler-plugin"></a>

## What is a plugin?
<a name="what-is-a-plugin"></a>

Bundler plugins are specialized gems that are aimed at integrating and extending Bundler's functionality.
This guide will help you start writing your own Bundler plugins.

## Why would I use a plugin?
<a name="why-would-i-use-a-plugin"></a>

Plugins are able to integrate with and extend Bundler.  
Currently, a plugin is able to:

- Add commands to Bundler (e.g. `bundle my_command`)
- Add a special handler to install a gem (e.g. Mercurial or SVN)
- Add functionality to specific hook points:
   - A list of all available hooks, their descriptions, and their block arguments are available
     [in the plugin/events.rb file.](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/plugin/events.rb)
   - Note: Make sure to check out the `events.rb` file in the version of Bundler you are using.

## Using a plugin
<a name="using-a-plugin"></a>

#### Install a plugin from a command
<a name="install-from-command"></a>

Plugins can be installed from RubyGems (default) or from a Git server.
To use a gem on your machine, you can run `bundler plugin install gem_name`.
Once the plugin is installed, the commands will be available for use and the hooks will be automatically registered with Bundler.

Run `bundler plugin help install` for more details help and instructions on installing from Git.

In Bundler 2.2.0, you can uninstall with `bundler plugin uninstall gem_name`.

#### Install a plugin from your Gemfile
<a name="install-from-gemfile"></a>

You can also specify a plugin in your Gemfile:

~~~ruby
plugin 'my_plugin' # Installs from Rubygems
plugin 'my_plugin', path: '/path/to/plugin' # Installs from a path
plugin 'my_plugin', git: 'https://github.com:repo/my_plugin.git' # Installs from Git
~~~

## Getting started with development
<a name="getting-started-with-development"></a>

### 1. Create a gem
<a name="create-a-gem"></a>

You'll first need to create a specialized gem before you can make a Bundler plugin.

[Create a gem using this guide.](./creating_gem.html)
When you're done, come back to this guide and move onto step two.

### 2. Create a plugins.rb file
<a name="plugins-rb" id="plugins_rb"></a>

A `plugins.rb` file is located at the top level of your gem's folder and is the entry point Bundler will use to call your plugin.
This is a Ruby file that defines your commands, hooks, and other code. Often, you may just require the gem's upper-most lib file.

For example, if your gem is called "my_plugin", you might have a file at `lib/my_plugin.rb` which contains the highest level namespace for your gem.
Your `plugins.rb` file might be:

~~~ruby
require 'my_plugin'
~~~

The `lib/my_plugin.rb` file would include other require statements, hooks, and commands similar to a normal gem.

### 3. Making Bundler commands
<a name="developing-your-plugin-commands" id="developing_your_plugin_commands"></a>

Bundler commands allow you to extend the Bundler interface with additional functionality.

To add a Bundler command, you need to make a class that registers itself (or another class) as a command.
For example, to add support for a `bundler my_command` command, you might create a class like so:

~~~ruby
class MyCommand < Bundler::Plugin::API
  # Register this class as a handler for the `my_command` command
  command "my_command"

  # The exec method will be called with the `command` and the `args`.
  # This is where you should handle all logic and functionality
  def exec(command, args)
    if args.empty?
      # Using BundlerError in plugins is recommended. See below.
      raise BundlerError, 'My plugin requires arguments'
    end
    puts "You called " + command + " with args: " + args.inspect
  end
end
~~~

or

~~~ruby
module MyCommand
  # Register this class as a handler for the `my_command` command
  Bundler::Plugin::API.command('my_command', self)

  # The exec method will be called with the `command_name` and the `args`.
  # This is where you should handle all logic and functionality
  def exec(command_name, args)
    puts "You called " + command_name + " with args: " + args.inspect
  end
end
~~~

These two elements are important in order for a command to register in Bundler:

1. `Bundler::Plugin::API.command(COMMAND_NAME, CLASS)` or `command 'COMMAND_NAME'` is called, depending on the method used (see examples above)
2. The class defines the instance method `exec(command_name, args)`

#### Raising Errors
<a name="raising-errors" id="raising_errors"></a>

If something goes wrong, your plugins should raise a `BundlerError`.
It's not recommended to raise e.g. `Exception` in a plugin, because that will cause Bundler to print its own bug report template, asking users to report the bug to Bundler itself.

To see in detail how bundler rescues errors, check out `bundler/friendly_errors.rb`.

### 4. Using Bundler hooks
<a name="developing-your-plugin-hooks" id="developing_your_plugin_hooks"></a>

To interface with various parts of Bundler, you can use a hook.
Hooks will let you inject some functionality at specific events by registering to listen for specific things to happen.
To listen to an event, you need to add a hook for it and provide a block.

For example, for a `Bundler::Plugin::Events::GEM_BEFORE_INSTALL_ALL` hook you must give a block that has an argument for an Array of `Bundler::Dependency` objects:

~~~ruby
Bundler::Plugin.add_hook('before-install-all') do |dependencies|
  # Do something with the dependencies
end
~~~

### 5. Developing a source plugin
<a name="developing-your-plugin-sources" id="developing_your_plugin_sources"></a>

A source plugin allows you to specify more possible installation sources to use within Bundler.
For example, let's say you want to install gems from Amazon S3. This can be done by building a plugin.

It is recommended to get familiar with the API for `Bundler::Plugin::API::Source` which is available
[on rubydoc.info](https://www.rubydoc.info/gems/bundler/Bundler/Plugin/API/Source)
or
[in the source code.](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/plugin/api/source.rb)

The basic overview of the source plugin is that you must subclass `Bundler::Plugin::API::Source` and override a number of methods.
Those methods are indicated in the docs/source code linked above.

Bundler uses the source plugin API to provide interfaces for RubyGems, Git, and path-based gems. The source code for these pieces may prove useful in understanding the API:

- [RubyGems source](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/rubygems.rb)
- [git source](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/git.rb)
- [path source](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/path.rb)

### 6. Running your plugin locally
<a name="running-your-plugin-locally" id="running_your_plugin_locally"></a>

To install and run your plugin locally, you can run `bundler plugin install --git '/PATH/TO/GEM' copycat`

### 7. Deploying your plugin
<a name="deploying-your-plugin" id="deploying_your_plugin"></a>

Deploy your plugin to RubyGems so others can install it. For instructions on deploying to RubyGems, visit
[this guide.](./creating_gem.html#releasing-the-gem)

Although plugins can be installed from a git branch, it's recommended to install plugins directly from RubyGems.

## Example Plugins
<a name="examples"></a>

Here are a few plugins that you can use as examples and inspiration:

- For a plugin that adds a command, take a look at
[rubygems/bundler-graph](https://github.com/rubygems/bundler-graph)
- For a plugin that makes use of hooks, take a look at
[jules2689/extended_bundler-errors](https://github.com/jules2689/extended_bundler-errors)
- For an example of source plugin, take a look at Bundler's implementations for
[the RubyGems source,](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/rubygems.rb)
[the git source,](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/git.rb)
and
[the path source](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/source/path.rb)

You can also look at the [full list of bundler plugins](./plugins.html).