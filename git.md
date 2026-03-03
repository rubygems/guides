---
title: How to install gems from git repositories
---
## How to install gems from git repositories

This document is written for Bundler 2.1 or higher.
Use `bundle config X Y` instead of `bundle config set X Y`
if you are still using Bundler 2.0 or earlier, which were already deprecated.

Bundler has the ability to install gems directly from git repositories. Installing
a gem using git is as easy as adding a gem to your Gemfile.

Note that because RubyGems lacks the ability to handle gems from git, any gems
installed from a git repository will not show up in `gem list`.
They will, however, be available after running `Bundler.setup`.

Specify that a gem should come from a git
repository with a .gemspec at its root

~~~ruby
gem 'rack', git: 'https://github.com/rack/rack'
~~~

If there is no .gemspec at the root of
a git repository, you must specify a version
that bundler should use when resolving
dependencies

~~~ruby
gem 'nokogiri', '1.7.0.1', git: 'https://github.com/sparklemotion/nokogiri'
~~~

If the gem is located within a subdirectory of
a git repository, you can use the `:glob` option
to specify the location of its .gemspec

~~~ruby
gem 'cf-copilot', git: 'https://github.com/cloudfoundry/copilot', glob: 'sdk/ruby/*.gemspec'
~~~

Specify that a git repository containing
multiple .gemspec files should be treated
as a gem source

~~~ruby
git 'https://github.com/rails/rails.git' do
  gem 'railties'
  gem 'actionpack'
  gem 'activemodel'
end
~~~

From the previous example, you may specify a particular ref, branch or tag

~~~ruby
git 'https://github.com/rails/rails.git', ref: '4aded' do
git 'https://github.com/rails/rails.git', branch: '5-0-stable' do
git 'https://github.com/rails/rails.git', tag: 'v5.0.0' do
~~~

Specifying a ref, branch, or tag for a
git repository specified inline works
exactly the same way

~~~ruby
gem 'nokogiri', git: 'https://github.com/sparklemotion/nokogiri.git', ref: '0bd839d'
gem 'nokogiri', git: 'https://github.com/sparklemotion/nokogiri.git', tag: '2.0.1'
gem 'nokogiri', git: 'https://github.com/sparklemotion/nokogiri.git', branch: 'rack-1.5'
~~~

Bundler can use HTTP(S), SSH, or git

~~~ruby
gem 'rack', git: 'https://github.com/rack/rack.git'
gem 'rack', git: 'git@github.com:rack/rack.git'
gem 'rack', git: 'git://github.com/rack/rack.git'
~~~

Specify that the submodules from a git repository
also should be expanded by bundler

~~~ruby
gem 'rugged', git: 'git://github.com/libgit2/rugged.git', submodules: true
~~~

If you are getting your gems from a public GitHub repository,
you can use the shorthand

~~~ruby
gem 'rack', github: 'rack/rack'
~~~

If the repository name is the same as the GitHub account hosting it,
you can omit it

~~~ruby
gem 'rails', github: 'rails'
~~~

*NB:* This shorthand can only be used for public repos in Bundler version 1.x. Use HTTPS for read and write:

~~~ruby
gem 'rails', git: 'https://github.com/rails/rails'
~~~

All of the usual `:git` options apply, like `:branch` and `:ref`.

~~~ruby
gem 'rails', github: 'rails', ref: 'a9752dcfd15bcddfe7b6f7126f3a6e0ba5927c56'
~~~

There are analogous shortcuts for Bitbucket (`:bitbucket`) and GitHub Gists (`:gist`).

~~~ruby
gem 'keystone', bitbucket: 'musicone/keystone'
gem 'my_gist', gist: '4815162342'
~~~

## Custom git sources

The `:github` shortcut used above is one of Bundler's built in git sources. Bundler comes
with shortcuts for `:github`, `:gist`, and `:bitbucket`, but you can
also add your own.

If you're using Github Enterprise, Stash, or just have a custom git setup, create your own shortcuts
by calling `git_source` before you use your custom option. Here's an example for Stash:

~~~ruby
git_source(:stash){ |repo_name| "https://stash.corp.acme.pl/#{repo_name}.git" }
gem 'rails', stash: 'forks/rails'
~~~

## Security

`http://` and `git://` URLs are insecure. A
man-in-the-middle attacker could tamper with the code as you check it out,
and potentially supply you with malicious code instead of the code you meant to
check out. Because the `:github` shortcut uses a `git://`
URL in Bundler 1.x versions, we recommend using HTTPS URLs or overriding
the `:github` shortcut with your own HTTPS git source.

## Local Git Repos
<a name="local"></a>

Bundler also allows you to work against a git repository locally
instead of using the remote version. This can be achieved by setting
up a local override:

~~~
$ bundle config set local.GEM_NAME /path/to/local/git/repository
~~~

For example, in order to use a local Rack repository, a developer could call:

~~~
$ bundle config set local.rack ~/Work/git/rack
~~~

and setup the git repo pointing to a branch:

~~~ruby
gem 'rack', github: 'rack/rack', branch: 'master'
~~~

Now instead of checking out the remote git repository, the local
override will be used. Similar to a path source, every time the local
git repository changes, the changes will be automatically picked up by
Bundler. This means a commit in the local git repo will update the
revision in the `Gemfile.lock` to the local git repo revision. This
requires the same attention as git submodules. Before pushing to
the remote, you need to ensure the local override was pushed, otherwise
you may point to a commit that only exists in your local machine.

**Please note!**
Bundler does many checks to ensure a developer won't work with
invalid references. Particularly, **we force a developer to specify
a branch in the `Gemfile` in order to use this feature**. If the branch
specified in the `Gemfile` and the current branch in the local git
repository do not match, Bundler will abort. This ensures that
a developer is always working against the correct branches, and prevents
accidental locking to a different branch.

Finally, Bundler also ensures that the current revision in the
`Gemfile.lock` exists in the local git repository. By doing this, Bundler
forces you to fetch the latest changes in the remotes.

If you do not want bundler to make these branch checks, you can override it by setting this option:

~~~
$ bundle config set disable_local_branch_check true
~~~
