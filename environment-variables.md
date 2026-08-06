---
layout: default
title: Environment variables
description: Environment variables that the gem command and the RubyGems runtime read
url: /environment-variables
previous: /configuration
next: /bundler_known_plugins
---

<em class="text-neutral-600">The environment variables the `gem` command and the RubyGems runtime respond to.</em>

None of these are required. They override defaults per shell or per process, which makes them useful in CI, in version manager hooks, and for one-off experiments. Persistent preferences belong in a gemrc file instead. See [Configuration](/configuration).

## Paths

| Variable | Description |
|----------|-------------|
| `GEM_HOME` | The directory gems are installed into. See [Where gems are installed and how they load](/gem-installation-and-loading). |
| `GEM_PATH` | Directories searched for installed gems, separated by `:` on Unix and `;` on Windows. |
| `GEM_SPEC_CACHE` | The directory where gem specifications fetched from remote sources are cached. Defaults to `~/.gem/specs`, or to `$XDG_CACHE_HOME/gem/specs` when `~/.gem/specs` does not exist. |
| `GEMRC` | Additional gemrc files to read, separated by `:` on Unix and `;` on Windows. See [Configuration](/configuration). |

## Loading gems

| Variable | Description |
|----------|-------------|
| `RUBYGEMS_GEMDEPS` | Path to a gem dependencies file (`Gemfile`, `gem.deps.rb`, or `Isolate`) whose gems RubyGems activates automatically at startup. The special value `-` searches the current directory and its parents for one. Automatic discovery can execute code from a directory you do not control, so avoid `-` on multiuser systems. |
| `GEM_REQUIREMENT_<NAME>` | A version requirement applied when RubyGems activates the gem `<NAME>`, uppercased. For example, `GEM_REQUIREMENT_BUNDLER="~> 2.7"` restricts which Bundler version is activated. |

## Building and pushing gems

| Variable | Description |
|----------|-------------|
| `SOURCE_DATE_EPOCH` | A Unix timestamp used instead of the current time when packaging a gem, so that building the same input twice produces byte-identical `.gem` files. |
| `RUBYGEMS_HOST` | The gem server that `gem push` sends gems to when no `--host` is given. |
| `GEM_HOST_API_KEY` | An API key used to authenticate against the gem server instead of the key stored in `~/.gem/credentials`. |
| `GEM_HOST_OTP_CODE` | A one-time password for pushing when the account has multi-factor authentication enabled. Equivalent to `--otp`. |
| `GEM_PRIVATE_KEY_PASSPHRASE` | The passphrase of the private signing key, read by `gem cert` and when building signed gems instead of prompting for it. |

## Network

| Variable | Description |
|----------|-------------|
| `HTTP_PROXY`, `HTTP_PROXY_USER`, `HTTP_PROXY_PASS` | The proxy server, and credentials for it, used for connections to gem servers. |
| `NO_PROXY` | Hosts that are connected to directly, bypassing the proxy. |

## Other

| Variable | Description |
|----------|-------------|
| `RUBYGEMS_PREVENT_UPDATE_SUGGESTION` | When set, the gem command never suggests running `gem update --system` after noticing a newer RubyGems release. |

## Bundler

Bundler variables are not listed here. Every setting understood by `bundle config` can also be set through a corresponding `BUNDLE_*` environment variable, for example `BUNDLE_PATH` or `BUNDLE_WITHOUT`. See [bundle config](/command-reference/bundle-config/).
