---
layout: default
title: How to develop multiple gems in one repository
url: /monorepo
previous: /git
next: /bundler_setup
---

<em class="text-neutral-600">Using path gems to develop a family of related gems side by side.</em>

Some projects outgrow a single gem. A library gains plugins, or a framework splits into components, and it becomes easier to develop the pieces together in one repository. Rust's Cargo and Python's uv call this arrangement a workspace. In Ruby the same workflow is built from Bundler's path source: each gem keeps its own directory and gemspec, and a shared Gemfile wires them together.

Path gems
---------

The `path:` option tells Bundler that a gem lives in a directory on the local file system instead of on a gem server:

~~~ruby
gem "mygem", path: "gems/mygem"
~~~

Relative paths are resolved against the directory containing the Gemfile. The directory must contain the gem's `.gemspec`, or the `gem` entry must specify an explicit version. Bundler loads the gem's code straight from that directory, so edits take effect the next time the code is loaded, with no rebuild or reinstall step.

`bundle install` records a path source in `Gemfile.lock` as a `PATH` block holding the relative path and the version from the gemspec:

~~~
PATH
  remote: gems/mygem
  specs:
    mygem (1.0.0)

DEPENDENCIES
  mygem!
~~~

The `!` marks a dependency pinned to a source declared in the Gemfile. See [How Gemfile.lock works](/gemfile-lock) for the full format.

A path source exists only in the Gemfile. A gemspec dependency can name nothing more than a gem and a version requirement, so a published gem cannot direct its users to a local directory. When a gem released from a monorepo is installed, its dependencies are resolved from a gem server like anyone else's. The path wiring is a development convenience that stays behind in the repository.

One Gemfile for many gems
-------------------------

A typical layout keeps each gem in its own directory, each with its own gemspec, and puts a single Gemfile at the root:

~~~
mygem/
├── Gemfile
├── Rakefile
└── gems/
    ├── mygem/
    │   ├── mygem.gemspec
    │   └── lib/
    └── mygem-cli/
        ├── mygem-cli.gemspec
        └── lib/
~~~

The root Gemfile can list each gem individually, or use the block form of `path`, which scans subdirectories of the given directory for gemspecs:

~~~ruby
source "https://rubygems.org"

path "gems" do
  gem "mygem"
  gem "mygem-cli"
end
~~~

One `bundle install` at the root resolves everything, and both gems land in the same `PATH` block of the lockfile:

~~~
PATH
  remote: gems
  specs:
    mygem (1.0.0)
    mygem-cli (1.0.0)
      mygem (~> 1.0)
~~~

An alternative is the [`gemspec` method](/gemfile#GEMSPEC) with its `:path` option, one call per gem:

~~~ruby
source "https://rubygems.org"

gemspec path: "gems/mygem"
gemspec path: "gems/mygem-cli"
~~~

The difference is what comes along. A `gem` entry with `path:` adds only the gem itself. `gemspec path:` also pulls that gem's runtime dependencies into the default group and its development dependencies into the `:development` group, which is useful when the root bundle is the development environment for every gem in the repository.

Gems that depend on each other
------------------------------

When one gem in the repository depends on another, the dependency is declared in the gemspec with an ordinary version constraint:

~~~ruby
Gem::Specification.new do |s|
  s.name = "mygem-cli"
  # ...
  s.add_dependency "mygem", "~> 1.0"
end
~~~

The division of labor follows [Gemfile and gemspec](/gemfile-and-gemspec). The gemspec states which released versions are compatible, and that constraint is what ships in the built gem. The Gemfile's path source decides where the dependency comes from during development, so Bundler satisfies the `mygem (~> 1.0)` requirement with the local copy rather than a release from rubygems.org. Because the dependency is pinned to its path source, versions on the gem server are never considered, and resolution fails outright if the local version stops matching the constraint.

Releasing
---------

Each gem is still packaged and published on its own. Run [`gem build` and `gem push`](/publishing), or the `rake release` task that `bundle gem` generates, inside each gem's directory. Repositories with many gems commonly add tasks to the root Rakefile that loop over the gem directories to build, tag, and push them together. Whether the gems share one version number or are versioned independently is a policy choice for the project. The constraints in the gemspecs are what keep a mixed set of released versions working together.

Rails is the best-known Ruby monorepo. The [rails/rails](https://github.com/rails/rails) repository holds railties, activesupport, actionpack, and the other framework gems, each in its own directory with its own gemspec, all released with the same version number. The [ruby/rubygems](https://github.com/ruby/rubygems) repository develops RubyGems and Bundler side by side in the same way.
