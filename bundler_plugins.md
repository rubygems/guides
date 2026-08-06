---
layout: default
title: How to write a Bundler plugin
url: /bundler_plugins
previous: /plugins
next: /troubleshooting
---

<em class="text-neutral-600">Extend Bundler with new commands, gem sources, and lifecycle hooks.</em>

A Bundler plugin is a regular gem with one extra file, `plugins.rb`, at its root. Through that file the gem can register three kinds of extensions:

- Commands, so that `bundle my_command` runs your code
- Gem sources, so that a Gemfile can install gems from somewhere other than a gem server, git, or a local path
- Lifecycle hooks, so that your code runs at events such as before or after `bundle install`

Installing and using plugins
----------------------------

Plugins install from a gem server by default, or from a git repository or local path:

    bundle plugin install my_plugin
    bundle plugin install my_plugin --git https://github.com/example/my_plugin
    bundle plugin install my_plugin --path /path/to/my_plugin

Once installed, the plugin's commands are available and its hooks are registered. `bundle plugin list` shows installed plugins and their commands, and `bundle plugin uninstall my_plugin` removes one.

A Gemfile can also declare plugins, and `bundle install` will install them:

    plugin "my_plugin"
    plugin "my_plugin", git: "https://github.com/example/my_plugin.git"
    plugin "my_plugin", path: "/path/to/my_plugin"

A plugin is a regular gem
-------------------------

Start by [creating a gem](/make-your-own-gem) as usual. That guide builds a command-line executable with Thor, but a plugin needs none of that. No executable, no CLI framework. Bundler talks to your plugin through `plugins.rb` instead.

`plugins.rb` lives at the top level of the gem, next to the gemspec, and is the entry point Bundler loads. Usually it just requires your gem's main file:

    require "my_plugin"

Make sure the gemspec ships this file. If `spec.files` is a hand-maintained list rather than `git ls-files`, add `plugins.rb` to it.

When the plugin is installed, Bundler runs `plugins.rb` once and records every command, source, and hook it registers into a plugin index. After that, Bundler loads the plugin again only when one of those registrations is used. Registration must therefore happen at load time, in code that runs when `plugins.rb` is required.

Adding a command
----------------

A command class needs two things: it registers itself for a command name, and it defines an instance method `exec`. The smallest working command plugin looks like this, with the class reached from `plugins.rb`:

    require "bundler/plugin/api"

    module MyPlugin
      class Hello < Bundler::Plugin::API
        command "hello"

        def exec(command, args)
          puts "Hello! You passed #{args.inspect}"
        end
      end
    end

When a user runs `bundle hello world --loud`, Bundler instantiates the registered class with no arguments and calls `exec("hello", ["world", "--loud"])`. The second argument is the raw list of remaining command-line arguments. Parse it however you like, for example with `OptionParser` as [bundler-graph](https://github.com/rubygems/bundler-graph) does.

Bundler routes only on the first word after `bundle`. Subcommands such as `bundle hello status` are yours to implement by dispatching on `args[0]`.

If you prefer not to inherit from `Bundler::Plugin::API`, register a plain class explicitly. It must still be a class with a public `exec` instance method, because Bundler calls `.new` on whatever you register:

    require "bundler/plugin/api"

    module MyPlugin
      class Hello
        Bundler::Plugin::API.command("hello", self)

        def exec(command, args)
          puts "Hello! You passed #{args.inspect}"
        end
      end
    end

### Raising errors

When something goes wrong, raise `Bundler::BundlerError` (or a subclass). Bundler rescues it and prints the message concisely. Any other exception makes Bundler print its bug report template asking users to file an issue against Bundler itself. The details are in [friendly_errors.rb](https://github.com/ruby/rubygems/blob/master/lib/bundler/friendly_errors.rb).

    raise Bundler::BundlerError, "my_command requires an argument" if args.empty?

### Commands and Thor

If your gem already has a Thor CLI, do not register the Thor class itself as the command. Thor classes define no `exec` instance method, so Bundler's call lands on the private `Kernel#exec` and the command crashes with `NoMethodError: private method 'exec' called`. Keep the Bundler command in its own small class and delegate to Thor from there:

    module MyPlugin
      class BundlerCommand < Bundler::Plugin::API
        command "my_command"

        def exec(command, args)
          MyPlugin::CLI.start(args)
        end
      end
    end

`MyPlugin::CLI.start(args)` here is the same entry point the gem's own executable would use. Delegating to Thor also gives you subcommands: [bundler-sbom](https://github.com/hsbt/bundler-sbom) registers the single command `sbom` and delegates to a Thor class with `dump` and `license` tasks, which is what makes `bundle sbom dump` work. Thor receives `["dump", ...]` and dispatches as usual.

### Plugin commands vs. executables on PATH

There is a second, older way to add a `bundle` subcommand that has nothing to do with plugins. When `bundle foo` matches neither a built-in command nor an installed plugin command, Bundler searches PATH for an executable named `bundler-foo` and runs it. [bundler-audit](https://github.com/rubysec/bundler-audit) works this way: installing the gem puts a `bundler-audit` executable on PATH, which makes `bundle audit` work. It is not a Bundler plugin and does not use the plugin API.

The two mechanisms differ in how they are installed and where they run. A PATH executable comes from a gem installed with `gem install` or a Gemfile, runs in its own process, and does not appear in `bundle plugin list`. A plugin command is installed with `bundle plugin install`, runs inside the Bundler process with access to Bundler's API, and is listed by `bundle plugin list`. If both exist for the same name, the plugin command wins. For a new project, prefer the plugin API. Adding command registration to a gem that already ships a `bundler-`prefixed executable changes nothing for its users except the installation method.

Running code at lifecycle events
--------------------------------

Hooks run your code when Bundler reaches specific events. Register a hook with the event name and a block. The block arguments depend on the event:

    require "bundler/plugin/api"

    Bundler::Plugin::API.hook("before-install-all") do |dependencies|
      puts "About to install #{dependencies.map(&:name).join(", ")}"
    end

The full list of events, with their descriptions and block arguments, is in [events.rb](https://github.com/ruby/rubygems/blob/master/lib/bundler/plugin/events.rb). Check the copy in the Bundler version you target, since events have been added over time. For a real-world example, [bundler-multilock](https://github.com/instructure/bundler-multilock) uses an `after-install-all` hook.

Adding a gem source
-------------------

A source plugin lets a Gemfile install gems from a place Bundler does not support natively, such as Amazon S3. Subclass `Bundler::Plugin::API::Source` and override at least `fetch_gemspec_files` and `install`. The required and overridable methods are documented in [api/source.rb](https://github.com/ruby/rubygems/blob/master/lib/bundler/plugin/api/source.rb).

Bundler's own sources implement the same interface, so their code is a useful reference: the [rubygems source](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/rubygems.rb), the [git source](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/git.rb), and the [path source](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/path.rb).

Developing your plugin locally
------------------------------

Install your work-in-progress plugin straight from its source directory:

    bundle plugin install my_plugin --path /path/to/my_plugin

Run this inside a project with a Gemfile and the plugin installs into the project's `.bundle/plugin` directory, keeping the experiment local. Run it outside any project and the plugin installs globally for your user.

A path-installed plugin runs directly from the source directory, so edits to your code take effect on the next `bundle` invocation. The exception is `plugins.rb` registrations, which Bundler caches in its index at install time. After adding or renaming a command, source, or hook, reinstall:

    bundle plugin uninstall my_plugin
    bundle plugin install my_plugin --path /path/to/my_plugin

Releasing your plugin
---------------------

A plugin is released like any other gem. [Publish it to RubyGems.org](/publishing) so others can install it with `bundle plugin install`.

Example plugins
---------------

- [bundler-graph](https://github.com/rubygems/bundler-graph) adds a command. It is maintained by the rubygems organization and is a good reference for the command API.
- [bundler-sbom](https://github.com/hsbt/bundler-sbom) delegates its command to a Thor CLI with subcommands.
- [bundler-multilock](https://github.com/instructure/bundler-multilock) uses a lifecycle hook.
- Bundler's built-in [rubygems](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/rubygems.rb), [git](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/git.rb), and [path](https://github.com/ruby/rubygems/blob/master/lib/bundler/source/path.rb) sources implement the source interface.

More are listed in the [known plugins list](/bundler_known_plugins).
