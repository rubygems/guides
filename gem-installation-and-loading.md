---
layout: default
title: Where gems are installed and how they load
url: /gem-installation-and-loading
previous: /gemfile-and-gemspec
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">How RubyGems decides where a gem lives on disk, and what happens when you require it.</em>

`gem install` copies files into a directory on your machine, and `require` finds them there later. Knowing where that directory is and how the lookup works explains most surprises with missing commands, wrong versions, and load errors.

Where gems are installed
------------------------

`gem env` prints the directories RubyGems is using. Three entries matter most:

    $ gem env
    RubyGems Environment:
      - RUBYGEMS VERSION: 4.0.16
      ...
      - INSTALLATION DIRECTORY: /Users/you/.local/share/mise/installs/ruby/4.0.5/lib/ruby/gems/4.0.0
      - USER INSTALLATION DIRECTORY: /Users/you/.gem/ruby/4.0.0
      ...
      - EXECUTABLE DIRECTORY: /Users/you/.local/share/mise/installs/ruby/4.0.5/bin
      ...
      - GEM PATHS:
         - /Users/you/.local/share/mise/installs/ruby/4.0.5/lib/ruby/gems/4.0.0
         - /Users/you/.gem/ruby/4.0.0

The installation directory, often called the gem home, is where `gem install` puts gems. Inside it, each gem version gets its own directory under `gems/`, such as `gems/rake-13.4.2/`, with metadata under `specifications/` and compiled extensions under `extensions/`. Because every version has its own directory, any number of versions of the same gem can be installed side by side.

The gem home belongs to one Ruby installation. It normally lives inside the Ruby installation itself, and its path includes the Ruby ABI version, `4.0.0` above, because gems with compiled extensions only work with the Ruby they were built for. The `GEM_HOME` environment variable overrides where gems are installed, and `GEM_PATH` overrides the list of directories searched when loading them. You rarely need to set either by hand. In scripts, `gem env gemdir` and `gem env gempath` print the values directly.

Installing without root permission
----------------------------------

With a Ruby that came with the operating system, the installation directory sits somewhere like `/usr/lib` and is not writable by a normal user. RubyGems then falls back to a user install automatically:

    $ gem install rake
    Defaulting to user installation because default installation directory (/usr/lib/ruby/gems/4.0.0) is not writable.

You can also request this explicitly with `gem install --user-install`. Either way the gem goes to the user installation directory shown by `gem env`, which is `~/.gem/ruby/<ruby version>` when a `~/.gem` directory already exists and `~/.local/share/gem/ruby/<ruby version>` otherwise. This directory is on `GEM_PATH` by default, so gems installed there load normally. Avoid `sudo gem install`. It scatters files owned by root through system directories, and a user install or a version manager achieves the same goal safely.

Executables and PATH
--------------------

Many gems ship commands, like `rake` or `rubocop`. On a plain install these go to the executable directory shown by `gem env`, which is the same `bin` directory that holds `ruby` itself, so they are on `PATH` whenever `ruby` is.

After a user install, however, executables land in `bin` under the user installation directory, and that directory is not on `PATH`. This is why a gem can install successfully and still leave you with `command not found`. Add the directory to `PATH` in your shell configuration:

    export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"

Open a new terminal after the change, then the commands resolve.

Version managers
----------------

Version managers such as rbenv, RVM, chruby, and mise install each Ruby under its own prefix in your home directory, and each of those Rubies brings its own gem home and executable directory. Switching Ruby versions therefore switches the whole set of installed gems, and nothing needs root permission. Gem homes are kept separate per Ruby version by default, so after installing a new Ruby you install your gems again for it. This is intentional. Compiled extensions built for one Ruby version do not load into another.

The gem home does not always sit inside the Ruby prefix. chruby, for example, sets `GEM_HOME` to a directory under `~/.gem` that is still separate for each Ruby version, so installed gems survive reinstalling the Ruby itself. Some setups go further and point every Ruby at one shared `GEM_HOME`. Gems written in pure Ruby are then genuinely shared across versions. Gems with compiled extensions keep their builds under `extensions/` separated by platform and Ruby ABI, and a version whose extension is not built for the running Ruby is skipped as if it were not installed, until `gem install` on that Ruby builds it.

Default gems
------------

Parts of Ruby's standard library are gems that ship inside Ruby itself, such as `json` and `psych`. Their specifications live in `specifications/default/` under the installation directory, and they can be required without installing anything. Unlike normal gems they cannot be uninstalled, though installing a newer version from RubyGems.org takes precedence over the shipped one. See [Default gems and bundled gems](/default-gems-and-bundled-gems).

How require finds a gem
-----------------------

Ruby loads RubyGems at startup, and RubyGems extends the built-in `require`. When you require a file that is not already on `$LOAD_PATH`, RubyGems searches the installed gems for one that contains it, picks the newest version, and activates it. Activation adds the gem's `lib` directory, and those of its dependencies, to `$LOAD_PATH`, and then the ordinary require proceeds:

    $ ruby -e 'require "rake"; puts $LOAD_PATH.grep(/rake/)'
    /Users/you/.local/share/mise/installs/ruby/4.0.5/lib/ruby/gems/4.0.0/gems/rake-13.4.2/lib

Installed versions coexist on disk, but activation picks exactly one per gem for the life of the process. To load something other than the newest version, call `gem` before requiring:

    $ ruby -e 'gem "rake", "= 13.3.1"; require "rake"; puts Rake::VERSION'
    13.3.1

Once a version is activated, activating a different one raises an error:

    $ ruby -e 'gem "rake", "= 13.3.1"; gem "rake", "= 13.4.2"'
    ... can't activate rake-13.4.2, already activated rake-13.3.1 (Gem::LoadError)

This is the error behind version conflicts in plain Ruby scripts. When you are unsure which file a require resolves to, `gem which rake` prints the full path.

When Bundler manages the process
--------------------------------

`bundle install` puts gems into the same gem home that `gem install` uses, so all projects on the same Ruby share one pool of installed gems. To give a project its own isolated location instead, run `bundle config set --local path vendor/bundle`, after which gems install under `vendor/bundle/ruby/<ruby version>` inside the project.

Loading also changes. `require "bundler/setup"` reads the `Gemfile` and `Gemfile.lock` and rebuilds `$LOAD_PATH` so that only the locked versions of the gems in the Gemfile are visible. Anything else in the gem home stays installed but cannot be required:

    $ ruby -rbundler/setup -e 'require "rspec"'
    ... cannot load such file -- rspec (LoadError)

Here `rspec` is installed, but it is not in the Gemfile, so the process cannot see it. This is what makes Bundler-managed applications reproducible. The versions that load are the ones in the lockfile, not whatever happens to be newest on the machine. See [How to use Bundler with Ruby](/bundler_setup).
