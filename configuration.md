---
layout: default
title: Configuration (.gemrc)
description: Where the gem command reads its configuration and the options a .gemrc file accepts
url: /configuration
previous: /bundler-compatibility
next: /environment-variables
---

<em class="text-neutral-600">Where the `gem` command reads its configuration, and the options a `.gemrc` file accepts.</em>

The `gem` command works fine with no configuration at all. A gemrc file exists to change defaults you would otherwise repeat on every invocation, such as disabling documentation generation or adding a private gem server.

## Files and precedence

RubyGems merges configuration from several places. Later entries override earlier ones:

1. Defaults set by the operating system packager and the Ruby implementation.
2. The system-wide file, `gemrc` in the system configuration directory, typically `/etc/gemrc`.
3. The user file, `~/.gemrc`. When that file does not exist, RubyGems reads `$XDG_CONFIG_HOME/gem/gemrc` instead, which is usually `~/.config/gem/gemrc`.
4. Files listed in the `GEMRC` environment variable, separated by `:` on Unix and `;` on Windows.

`gem --config-file FILE` reads a specific file in place of the user file, and `gem --norc` ignores gemrc files entirely.

## Format

A gemrc file is a YAML hash with two kinds of keys. Symbol keys, written with a leading colon, set RubyGems options. String keys naming a gem command set default command-line arguments for that command, and the special key `gem` sets default arguments for every command.

```yaml
:sources:
- https://rubygems.org/
:backtrace: true
:concurrent_downloads: 16
install: --no-document
update: --no-document
```

With this file, `gem install rails` behaves as if you had typed `gem install rails --no-document`. Arguments given on the command line are appended after the defaults.

## Options

These are the symbol keys RubyGems understands, with their built-in defaults.

| Key | Description |
|-----|-------------|
| `:sources` | Array of gem server URLs that gems are installed from. Default: `https://rubygems.org/`. |
| `:backtrace` | Print a full backtrace when the gem command hits an error. Default: `true`. |
| `:verbose` | Output level. `false` is quiet, `true` is normal, and any other value such as `:really` enables extra output. Default: `true`. |
| `:update_sources` | Update repository metadata automatically. Default: `true`. |
| `:concurrent_downloads` | Number of gem downloads performed in parallel. Default: `8`. |
| `:cert_expiration_length_days` | Validity period, in days, of certificates created or re-signed by `gem cert`. Default: `365`. |
| `:install_extension_in_lib` | Install built extensions into the gem's `lib` directory as well as the extension directory. Default: `true`. |
| `:ipv4_fallback_enabled` | Experimental. Fall back to IPv4 when IPv6 is unreachable or slow. Default: `false`. |
| `:global_gem_cache` | Cache downloaded `.gem` files in one directory shared across all Ruby installations, `~/.cache/gem/gems` by default. Default: `false`. |
| `:use_psych` | Parse gemrc and other RubyGems YAML files with Psych instead of the built-in minimal YAML parser. Default: `false`. |
| `:prevent_update_suggestion` | Never suggest running `gem update --system` when a newer RubyGems is available. |
| `:disable_default_gem_server` | Require an explicit `--host` when pushing gems instead of defaulting to RubyGems.org. |
| `:gemhome` | The directory gems are installed into. More commonly set with the `GEM_HOME` environment variable. |
| `:gempath` | Array of directories searched for installed gems. More commonly set with the `GEM_PATH` environment variable. |
| `:ssl_verify_mode` | OpenSSL verification mode for HTTPS connections to gem servers. |
| `:ssl_ca_cert` | Path to a CA certificate file or directory used for HTTPS connections. |
| `:ssl_client_cert` | Path to a client certificate used for HTTPS connections that require client authentication. |

API keys for pushing gems are not stored in gemrc. They live in a separate credentials file, `~/.gem/credentials`. See [API key scopes](/api-key-scopes) for how keys are created and scoped.

Bundler is configured separately through `bundle config`, and its settings do not come from gemrc. See [bundle config](/command-reference/bundle-config/).
