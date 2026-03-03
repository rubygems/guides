---
title: Ruby Directive
---

## Specifying a Ruby Version

Like gems, developers can setup a dependency on Ruby.
This makes your app fail faster in case you depend on specific features in a Ruby VM.
This way, the Ruby VM on your deployment server will match your local one. You can do this by using the `ruby` directive in the `Gemfile`:

~~~ruby
ruby 'RUBY_VERSION', :engine => 'ENGINE', :engine_version => 'ENGINE_VERSION',
:patchlevel => 'RUBY_PATCHLEVEL'
~~~

If you wanted to use JRuby 9.4.10.0 using Ruby 3.1.4, you would simply do the following:

~~~ruby
ruby '3.1.4', :engine => 'jruby', :engine_version => '9.4.10.0'
~~~

It's also possible to restrict the patchlevel of the Ruby used by doing the following:

~~~ruby
ruby '3.3.6', :patchlevel => '108'
~~~

If you wish to derive your Ruby version from a version file (i.e. `.ruby-version`),
you can use the `file` option instead.

~~~ruby
ruby file: ".ruby-version"
~~~

The version file should conform to any of the following formats:

- `3.1.2` (`.ruby-version`)
- `ruby-3.1.2` (`.ruby-version`)
- `ruby 3.1.2` ([`.tool-versions`](https://asdf-vm.com/manage/configuration.html#tool-versions))
- `ruby = '3.1.2'` ([`mise.toml`](https://mise.jdx.dev/dev-tools/))

Bundler will make checks against the current running Ruby VM to make sure it matches what is specified in the `Gemfile`. If things don't match, Bundler will raise an Exception explaining what doesn't match.

~~~
Your Ruby version is 3.3.7, but your Gemfile specified 3.4.1
~~~

Both `:engine` and `:engine_version` are optional.
When these options are omitted, this means the app is compatible with a particular Ruby ABI but the engine is irrelevant.
When `:engine` is used, `:engine_version` must also be specified.
Using the `platform` command with the `--ruby` flag, you can see what `ruby` directive is specified in the `Gemfile`.

~~~
ruby 3.1.4p0 (jruby 9.4.10.0)
~~~

<a href="/man/bundle-platform.1.html" class="btn btn-primary">Learn More: bundle platform</a>

In the `ruby` directive, `:patchlevel` is optional, as patchlevel releases are usually compatible and include important security fixes.
The patchlevel option checks the `RUBY_PATCHLEVEL` constant, and if not specified then bundler will simply ignore it.
Version operators for specifying a Ruby version are also available.
The set of supported version operators is that of Rubygems (`gem` version operators). (ie. `<`, `>`, `<=`, `>=`, `~>`, `=`)

~~~ruby
ruby '~> 3.3.0'
~~~

<a href="https://guides.rubygems.org/patterns/#declaring-dependencies" class="btn btn-primary">Learn More: Version Operators</a>
