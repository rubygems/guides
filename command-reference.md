---
layout: default
title: Command Reference
url: /command-reference
previous: /specification-reference
next: /rubygems-org-api
---

<em class="t-gray">What each `gem` command does, and how to use it.</em>

This reference was automatically generated from RubyGems version 3.4.8.

* [gem build](#gem-build)
* [gem cert](#gem-cert)
* [gem check](#gem-check)
* [gem cleanup](#gem-cleanup)
* [gem contents](#gem-contents)
* [gem dependency](#gem-dependency)
* [gem environment](#gem-environment)
* [gem exec](#gem-exec)
* [gem fetch](#gem-fetch)
* [gem generate_index](#gem-generate_index)
* [gem help](#gem-help)
* [gem info](#gem-info)
* [gem install](#gem-install)
* [gem list](#gem-list)
* [gem lock](#gem-lock)
* [gem mirror](#gem-mirror)
* [gem open](#gem-open)
* [gem outdated](#gem-outdated)
* [gem owner](#gem-owner)
* [gem pristine](#gem-pristine)
* [gem push](#gem-push)
* [gem query](#gem-query)
* [gem rdoc](#gem-rdoc)
* [gem search](#gem-search)
* [gem server](#gem-server)
* [gem signin](#gem-signin)
* [gem signout](#gem-signout)
* [gem sources](#gem-sources)
* [gem specification](#gem-specification)
* [gem stale](#gem-stale)
* [gem uninstall](#gem-uninstall)
* [gem unpack](#gem-unpack)
* [gem update](#gem-update)
* [gem which](#gem-which)
* [gem yank](#gem-yank)

## gem build

Build a gem from a gemspec

### Usage

    gem build GEMSPEC_FILE [options]

### Options

* `--platform PLATFORM`         - Specify the platform of gem to build
* `--force`                     - skip validation of the spec
* `--strict`                    - consider warnings as errors when validating the spec
* `-o, --output FILE`               - output gem with the given filename
* `-C PATH`                         - Run as if gem build was started in <PATH> instead of the current working directory.

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMSPEC_FILE* -   gemspec file name to build a gem for

### Description

The build command allows you to create a gem from a ruby gemspec.

The best way to build a gem is to use a Rakefile and the Gem::PackageTask
which ships with RubyGems.

The gemspec can either be created by hand or extracted from an existing gem
with gem spec:

    $ gem unpack my_gem-1.0.gem
    Unpacked gem: '.../my_gem-1.0'
    $ gem spec my_gem-1.0.gem --ruby > my_gem-1.0/my_gem-1.0.gemspec
    $ cd my_gem-1.0
    [edit gem contents]
    $ gem build my_gem-1.0.gemspec

Gems can be saved to a specified filename with the output option:

    $ gem build my_gem-1.0.gemspec --output=release.gem

## gem cert

Manage RubyGems certificates and signing settings

### Usage

    gem cert [options]

### Options

* `-a, --add CERT`                  - Add a trusted certificate.
* `-l, --list [FILTER]`             - List trusted certificates where the subject contains FILTER
* `-r, --remove FILTER`             - Remove trusted certificates where the subject contains FILTER
* `-b, --build EMAIL_ADDR`          - Build private key and self-signed certificate for EMAIL_ADDR
* `-C, --certificate CERT`          - Signing certificate for `--sign`
* `-K, --private-key KEY`           - Key for `--sign` or `--build`
* `-A, --key-algorithm ALGORITHM`   - Select which key algorithm to use for `--build`
* `-s, --sign CERT`                 - Signs CERT with the key from `-K` and the certificate from `-C`
* `-d, --days NUMBER_OF_DAYS`       - Days before the certificate expires
* `-R, --re-sign`                   - Re-signs the certificate from `-C` with the key from `-K`

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The cert command manages signing keys and certificates for creating signed
gems.  Your signing certificate and private key are typically stored in
~/.gem/gem-public_cert.pem and ~/.gem/gem-private_key.pem respectively.

To build a certificate for signing gems:

    gem cert --build you@example

If you already have an RSA key, or are creating a new certificate for an
existing key:

    gem cert --build you@example --private-key /path/to/key.pem

If you wish to trust a certificate you can add it to the trust list with:

    gem cert --add /path/to/cert.pem

You can list trusted certificates with:

    gem cert --list

or:

    gem cert --list cert_subject_substring

If you wish to remove a previously trusted certificate:

    gem cert --remove cert_subject_substring

To sign another gem author's certificate:

    gem cert --sign /path/to/other_cert.pem

For further reading on signing gems see `ri Gem::Security`.

## gem check

Check a gem repository for added or missing files

### Usage

    gem check [OPTIONS] [GEMNAME ...] [options]

### Options

* `-a, --[no-]alien`                - Report "unmanaged" or rogue files in the gem repository
* `--[no-]doctor`               - Clean up uninstalled gems and broken specifications
* `--[no-]dry-run`              - Do not remove files, only report what would be removed
* `--[no-]gems`                 - Check installed gems for problems
* `-v, --version VERSION`           - Specify version of gem to check

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to check

### Description

The check command can list and repair problems with installed gems and
specifications and will clean up gems that have been partially uninstalled.

## gem cleanup

Clean up old versions of installed gems

### Usage

    gem cleanup [GEMNAME ...] [options]

### Options

* `-n, -d, --dry-run`               - Do not uninstall gems
* `-D, --[no-]check-development`    - Check development dependencies while uninstalling (default: true)
* `--[no-]user-install`         - Cleanup in user's home directory instead of GEM_HOME.

### Deprecated Options

* `--dryrun`                    - Do not uninstall gems

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to cleanup

### Description

The cleanup command removes old versions of gems from GEM_HOME that are not
required to meet a dependency.  If a gem is installed elsewhere in GEM_PATH
the cleanup command won't delete it.

If no gems are named all gems in GEM_HOME are cleaned.

## gem contents

Display the contents of the installed gems

### Usage

    gem contents GEMNAME [GEMNAME ...] [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to contents
* `--all`                       - Contents for all gems
* `-s, --spec-dir a,b,c`            - Search for gems under specific paths
* `-l, --[no-]lib-only`             - Only return files in the Gem's lib_dirs
* `--[no-]prefix`               - Don't include installed path prefix
* `--[no-]show-install-dir`     - Show only the gem install dir

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to list contents for

### Description

The contents command lists the files in an installed gem.  The listing can
be given as full file names, file names without the installed directory
prefix or only the files that are requireable.

## gem dependency

Show the dependencies of an installed gem

### Usage

    gem dependency REGEXP [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to dependency
* `--platform PLATFORM`         - Specify the platform of gem to dependency
* `--[no-]prerelease`           - Allow prerelease versions of a gem
* `-R`, `--[no-]reverse-dependencies` - Include reverse dependencies in the output
* `--pipe`                      - Pipe Format (name `--version` ver)

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *REGEXP* -         show dependencies for gems whose names start with REGEXP

### Description

The dependency commands lists which other gems a given gem depends on.  For
local gems only the reverse dependencies can be shown (which gems depend on
the named gem).

The dependency list can be displayed in a format suitable for piping for
use with other commands.

## gem environment

Display information about the RubyGems environment

### Usage

    gem environment [arg] [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *home* -             display the path where gems are installed. Aliases: gemhome, gemdir, GEM_HOME
* *path* -             display path used to search for gems. Aliases: gempath, GEM_PATH
* *user_gemhome* -     display the path where gems are installed when `--user-install` is given. Aliases: user_gemdir
* *version* -          display the gem format version
* *remotesources* -    display the remote gem servers
* *platform* -         display the supported gem platforms
* *&lt;omitted&gt;* -        display everything

### Description

The environment command lets you query rubygems for its configuration for
use in shell scripts or as a debugging aid.

The RubyGems environment can be controlled through command line arguments,
gemrc files, environment variables and built-in defaults.

Command line argument defaults and some RubyGems defaults can be set in a
~/.gemrc file for individual users and a gemrc in the SYSTEM CONFIGURATION
DIRECTORY for all users. These files are YAML files with the following YAML
keys:

    :sources: A YAML array of remote gem repositories to install gems from
    :verbose: Verbosity of the gem command. false, true, and :really are the
              levels
    :update_sources: Enable/disable automatic updating of repository metadata
    :backtrace: Print backtrace when RubyGems encounters an error
    :gempath: The paths in which to look for gems
    :disable_default_gem_server: Force specification of gem server host on push
    <gem_command>: A string containing arguments for the specified gem command

Example:

    :verbose: false
    install: --no-wrappers
    update: --no-wrappers
    :disable_default_gem_server: true

RubyGems' default local repository can be overridden with the GEM_PATH and
GEM_HOME environment variables. GEM_HOME sets the default repository to
install into. GEM_PATH allows multiple local repositories to be searched for
gems.

If you are behind a proxy server, RubyGems uses the HTTP_PROXY,
HTTP_PROXY_USER and HTTP_PROXY_PASS environment variables to discover the
proxy server.

If you would like to push gems to a private gem server the RUBYGEMS_HOST
environment variable can be set to the URI for that server.

If you are packaging RubyGems all of RubyGems' defaults are in
lib/rubygems/defaults.rb.  You may override these in
lib/rubygems/defaults/operating_system.rb

## gem exec

Run a command from a gem

### Usage

    gem exec [options --] COMMAND [args] [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to exec
* `--[no-]prerelease`           - Allow prerelease versions of a gem to be installed
* `-g, --gem GEM`                   - run the executable from the given gem

### Install/Update Options

* `--conservative`               Prefer the most recent installed version, - rather than the latest version overall

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *COMMAND* -   the executable command to run

### Description

The exec command handles installing (if necessary) and running an executable
from a gem, regardless of whether that gem is currently installed.

The exec command can be thought of as a shortcut to running `gem install` and
then the executable from the installed gem.

For example, `gem exec rails new .` will run `rails new .` in the current
directory, without having to manually run `gem install rails`.
Additionally, the exec command ensures the most recent version of the gem
is used (unless run with `--conservative`), and that the gem is not installed
to the same gem path as user-installed gems.

## gem fetch

Download a gem and place it in the current directory

### Usage

    gem fetch GEMNAME [GEMNAME ...] [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to fetch
* `--platform PLATFORM`         - Specify the platform of gem to fetch
* `--[no-]prerelease`           - Allow prerelease versions of a gem
* `--[no-]suggestions`          - Suggest alternates when gems are not found

### Local/Remote Options

* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations
* `-s, --source URL`                - Append URL to list of remote gem sources
* `--clear-sources`             - Clear the gem sources

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to download

### Description

The fetch command fetches gem files that can be stored for later use or
unpacked to examine their contents.

See the build command help for an example of unpacking a gem, modifying it,
then repackaging it.

## gem generate_index

Generates the index files for a gem server directory

### Usage

    gem generate_index [options]

### Options

* `-d, --directory=DIRNAME`         - repository base dir containing gems subdir
* `--[no-]modern`               - Generate indexes for RubyGems (always true)
* `--update`                    - Update modern indexes with gems added since the last update

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The generate_index command creates a set of indexes for serving gems
statically.  The command expects a 'gems' directory under the path given to
the --directory option.  The given directory will be the directory you serve
as the gem repository.

For `gem generate_index --directory /path/to/repo`, expose /path/to/repo via
your HTTP server configuration (not /path/to/repo/gems).

When done, it will generate a set of files like this:

    gems/*.gem                                   # .gem files you want to
                                                 # index

    specs.<version>.gz                           # specs index
    latest_specs.<version>.gz                    # latest specs index
    prerelease_specs.<version>.gz                # prerelease specs index
    quick/Marshal.<version>/<gemname>.gemspec.rz # Marshal quick index file

The .rz extension files are compressed with the inflate algorithm.
The Marshal version number comes from ruby's Marshal::MAJOR_VERSION and
Marshal::MINOR_VERSION constants.  It is used to ensure compatibility.

## gem help

Provide help on the 'gem' command

### Usage

    gem help ARGUMENT [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

## gem info

Show information for the given gem

### Usage

    gem info GEMNAME [options]

### Options

* `-i, --[no-]installed`            - Check for installed gem
* `-I`                              - Equivalent to `--no-installed`
* `-v, --version VERSION`           - Specify version of gem to info for use with `--installed`
* `--[no-]versions`             - Display only gem names
* `-a, --all`                       - Display all gem versions
* `-e, --exact`                     - Name of gem(s) to query on matches the provided STRING
* `--[no-]prerelease`           - Display prerelease versions

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -         name of the gem to print information about

### Description

Info prints information about the gem such as name, description, website, license and installed paths

## gem install

Install a gem into the local repository

### Usage

    gem install [options] GEMNAME [GEMNAME ...] -- --build-flags [options]

### Options

* `--platform PLATFORM`         - Specify the platform of gem to install
* `-v, --version VERSION`           - Specify version of gem to install
* `--[no-]prerelease`           - Allow prerelease versions of a gem to be installed. (Only for listed gems)

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Install/Update Options

* `-i, --install-dir DIR`           - Gem repository directory to get installed gems
* `-n, --bindir DIR`                - Directory where executables will be placed when the gem is installed
* `--document [TYPES]`          - Generate documentation for installed gems List the documentation types you wish to generate.  For example: rdoc,ri
* `--build-root DIR`            - Temporary installation root. Useful for building packages. Do not use this when installing remote gems.
* `--vendor`                    - Install gem into the vendor directory. Only for use by gem repackagers.
* `-N, --no-document`               - Disable documentation generation
* `-E, --[no-]env-shebang`          - Rewrite the shebang line on installed scripts to use /usr/bin/env
* `-f, --[no-]force`                - Force gem to install, bypassing dependency checks
* `-w, --[no-]wrappers`             - Use bin wrappers for executables Not available on dosish platforms
* `-P, --trust-policy POLICY`       - Specify gem trust policy
* `--ignore-dependencies`       - Do not install any required dependent gems
* `--[no-]format-executable`    - Make installed executable names match Ruby. If Ruby is ruby18, foo_exec will be foo_exec18
* `--[no-]user-install`         - Install in user's home directory instead of GEM_HOME.
* `--development`               - Install additional development dependencies
* `--development-all`           - Install development dependencies for all gems (including dev deps themselves)
* `--conservative`              - Don't attempt to upgrade gems already meeting version requirement
* `--[no-]minimal-deps`         - Don't upgrade any dependencies that already meet version requirements
* `--[no-]post-install-message` - Print post install message
* `-g, --file [FILE]`               - Read from a gem dependencies API file and install the listed gems
* `--without GROUPS`            - Omit the named groups (comma separated) when installing from a gem dependencies file
* `--default`                   - Add the gem's full specification to specifications/default and extract only its bin
* `--explain`                   - Rather than install the gems, indicate which would be installed
* `--[no-]lock`                 - Create a lock file (when used with `-g`/`--file`)
* `--[no-]suggestions`          - Suggest alternates when gems are not found

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to install

### Description

The install command installs local or remote gem into a gem repository.

For gems with executables ruby installs a wrapper file into the executable
directory by default.  This can be overridden with the --no-wrappers option.
The wrapper allows you to choose among alternate gem versions using _version_.

For example `rake _0.7.3_ --version` will run rake version 0.7.3 if a newer
version is also installed.

Gem Dependency Files
====================

RubyGems can install a consistent set of gems across multiple environments
using `gem install -g` when a gem dependencies file (gem.deps.rb, Gemfile or
Isolate) is present.  If no explicit file is given RubyGems attempts to find
one in the current directory.

When the RUBYGEMS_GEMDEPS environment variable is set to a gem dependencies
file the gems from that file will be activated at startup time.  Set it to a
specific filename or to "-" to have RubyGems automatically discover the gem
dependencies file by walking up from the current directory.

NOTE: Enabling automatic discovery on multiuser systems can lead to
execution of arbitrary code when used from directories outside your control.

Extension Install Failures
==========================

If an extension fails to compile during gem installation the gem
specification is not written out, but the gem remains unpacked in the
repository.  You may need to specify the path to the library's headers and
libraries to continue.  You can do this by adding a -- between RubyGems'
options and the extension's build options:

    $ gem install some_extension_gem
    [build fails]
    Gem files will remain installed in \
    /path/to/gems/some_extension_gem-1.0 for inspection.
    Results logged to /path/to/gems/some_extension_gem-1.0/gem_make.out
    $ gem install some_extension_gem -- --with-extension-lib=/path/to/lib
    [build succeeds]
    $ gem list some_extension_gem

    *** LOCAL GEMS ***

    some_extension_gem (1.0)
    $

If you correct the compilation errors by editing the gem files you will need
to write the specification by hand.  For example:

    $ gem install some_extension_gem
    [build fails]
    Gem files will remain installed in \
    /path/to/gems/some_extension_gem-1.0 for inspection.
    Results logged to /path/to/gems/some_extension_gem-1.0/gem_make.out
    $ [cd /path/to/gems/some_extension_gem-1.0]
    $ [edit files or what-have-you and run make]
    $ gem spec ../../cache/some_extension_gem-1.0.gem --ruby > \
               ../../specifications/some_extension_gem-1.0.gemspec
    $ gem list some_extension_gem

    *** LOCAL GEMS ***

    some_extension_gem (1.0)
    $

Command Alias
==========================

You can use `i` command instead of `install`.

    $ gem i GEMNAME

## gem list

Display local gems whose name matches REGEXP

### Usage

    gem list [REGEXP ...] [options]

### Options

* `-i, --[no-]installed`            - Check for installed gem
* `-I`                              - Equivalent to `--no-installed`
* `-v, --version VERSION`           - Specify version of gem to list for use with `--installed`
* `-d, --[no-]details`              - Display detailed information of gem(s)
* `--[no-]versions`             - Display only gem names
* `-a, --all`                       - Display all gem versions
* `-e, --exact`                     - Name of gem(s) to query on matches the provided STRING
* `--[no-]prerelease`           - Display prerelease versions

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *REGEXP* -         regexp to look for in gem name

### Description

The list command is used to view the gems you have installed locally.

The --details option displays additional details including the summary, the
homepage, the author, the locations of different versions of the gem.

To search for remote gems use the search command.

## gem lock

Generate a lockdown list of gems

### Usage

    gem lock GEMNAME-VERSION [GEMNAME-VERSION ...] [options]

### Options

* `-s, --[no-]strict`               - fail if unable to satisfy a dependency

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to lock
* *VERSION* -        version of gem to lock

### Description

The lock command will generate a list of +gem+ statements that will lock down
the versions for the gem given in the command line.  It will specify exact
versions in the requirements list to ensure that the gems loaded will always
be consistent.  A full recursive search of all effected gems will be
generated.

Example:

    gem lock rails-1.0.0 > lockdown.rb

will produce in lockdown.rb:

    require "rubygems"
    gem 'rails', '= 1.0.0'
    gem 'rake', '= 0.7.0.1'
    gem 'activesupport', '= 1.2.5'
    gem 'activerecord', '= 1.13.2'
    gem 'actionpack', '= 1.11.2'
    gem 'actionmailer', '= 1.1.5'
    gem 'actionwebservice', '= 1.0.0'

Just load lockdown.rb from your application to ensure that the current
versions are loaded.  Make sure that lockdown.rb is loaded *before* any
other require statements.

Notice that rails 1.0.0 only requires that rake 0.6.2 or better be used.
Rake-0.7.0.1 is the most recent version installed that satisfies that, so we
lock it down to the exact version.

## gem mirror

Mirror all gem files (requires rubygems-mirror)

### Usage

    gem mirror [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The mirror command has been moved to the rubygems-mirror gem.

## gem open

Open gem sources in editor

### Usage

    gem open [-e COMMAND] GEMNAME [options]

### Options

* `-e, --editor COMMAND`            - Prepends COMMAND to gem path. Could be used to specify editor.
* `-v, --version VERSION`           - Opens specific gem version

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -      name of gem to open in editor

### Description

          The open command opens gem in editor and changes current path
          to gem's source directory.
          Editor command can be specified with -e option, otherwise rubygems
          will look for editor in $EDITOR, $VISUAL and $GEM_EDITOR variables.

## gem outdated

Display all gems that need updates

### Usage

    gem outdated [options]

### Options

* `--platform PLATFORM`         - Specify the platform of gem to outdated

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The outdated command lists gems you may wish to upgrade to a newer version.

You can check for dependency mismatches using the dependency command and
update the gems with the update or install commands.

## gem owner

Manage gem owners of a gem on the push server

### Usage

    gem owner GEM [options]

### Options

* `-k, --key KEYNAME`               - Use the given API key from ~/.local/share/gem/credentials
* `--otp CODE`                  - Digit code for multifactor authentication You can also use the environment variable GEM_HOST_OTP_CODE
* `-a, --add NEW_OWNER`             - Add an owner by user identifier
* `-r, --remove OLD_OWNER`          - Remove an owner by user identifier
* `--host HOST`                 - Use another gemcutter-compatible host (e.g. https://rubygems.org)

### Local/Remote Options

* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEM* -        gem to manage owners for

### Description

The owner command lets you add and remove owners of a gem on a push
server (the default is https://rubygems.org). Multiple owners can be
added or removed at the same time, if the flag is given multiple times.

The supported user identifiers are dependent on the push server.
For rubygems.org, both e-mail and handle are supported, even though the
user identifier field is called "email".

The owner of a gem has the permission to push new versions, yank existing
versions or edit the HTML page of the gem.  Be careful of who you give push
permission to.

## gem pristine

Restores installed gems to pristine condition from files located in the gem cache

### Usage

    gem pristine [GEMNAME ...] [options]

### Options

* `--all`                       - Restore all installed gems to pristine condition
* `--skip=gem_name`             - used on `--all`, skip if name == gem_name
* `--[no-]extensions`           - Restore gems with extensions in addition to regular gems
* `--only-executables`          - Only restore executables
* `--only-plugins`              - Only restore plugins
* `-E, --[no-]env-shebang`          - Rewrite executables with a shebang of /usr/bin/env
* `-i, --install-dir DIR`           - Gem repository to get binstubs and plugins installed
* `-n, --bindir DIR`                - Directory where executables are located
* `-v, --version VERSION`           - Specify version of gem to restore to pristine condition

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        gem to restore to pristine condition (unless --all)

### Description

The pristine command compares an installed gem with the contents of its
cached .gem file and restores any files that don't match the cached .gem's
copy.

If you have made modifications to an installed gem, the pristine command
will revert them.  All extensions are rebuilt and all bin stubs for the gem
are regenerated after checking for modifications.

If the cached gem cannot be found it will be downloaded.

If --no-extensions is provided pristine will not attempt to restore a gem
with an extension.

If --extensions is given (but not --all or gem names) only gems with
extensions will be restored.

## gem push

Push a gem up to the gem server

### Usage

    gem push GEM [options]

### Options

* `-k, --key KEYNAME`               - Use the given API key from ~/.local/share/gem/credentials
* `--otp CODE`                  - Digit code for multifactor authentication You can also use the environment variable GEM_HOST_OTP_CODE
* `--host HOST`                 - Push to another gemcutter-compatible host (e.g. https://rubygems.org)

### Local/Remote Options

* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEM* -        built gem to push up

### Description

The push command uploads a gem to the push server (the default is
https://rubygems.org) and adds it to the index.

The gem can be removed from the index and deleted from the server using the yank
command.  For further discussion see the help for the yank command.

The push command will use ~/.gem/credentials to authenticate to a server, but you can use the RubyGems environment variable GEM_HOST_API_KEY to set the api key to authenticate.

## gem query

Query gem information in local or remote repositories

### Usage

    gem query [options]

### Options

* `-n, --name-matches REGEXP`       - Name of gem(s) to query on matches the provided REGEXP
* `-i, --[no-]installed`            - Check for installed gem
* `-I`                              - Equivalent to `--no-installed`
* `-v, --version VERSION`           - Specify version of gem to query for use with `--installed`
* `-d, --[no-]details`              - Display detailed information of gem(s)
* `--[no-]versions`             - Display only gem names
* `-a, --all`                       - Display all gem versions
* `-e, --exact`                     - Name of gem(s) to query on matches the provided STRING
* `--[no-]prerelease`           - Display prerelease versions

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The query command is the basis for the list and search commands.

You should really use the list and search commands instead.  This command
is too hard to use.

## gem rdoc

Generates RDoc for pre-installed gems

### Usage

    gem rdoc [args] [options]

### Options

* `--all`                       - Generate RDoc/RI documentation for all installed gems
* `--[no-]rdoc`                 - Generate RDoc HTML
* `--[no-]ri`                   - Generate RI data
* `--[no-]overwrite`            - Overwrite installed documents
* `-v, --version VERSION`           - Specify version of gem to rdoc

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        gem to generate documentation for (unless --all)

### Description

The rdoc command builds documentation for installed gems.  By default
only documentation is built using rdoc, but additional types of
documentation may be built through rubygems plugins and the
Gem.post_installs hook.

Use --overwrite to force rebuilding of documentation.

## gem search

Display remote gems whose name matches REGEXP

### Usage

    gem search [REGEXP] [options]

### Options

* `-i, --[no-]installed`            - Check for installed gem
* `-I`                              - Equivalent to `--no-installed`
* `-v, --version VERSION`           - Specify version of gem to search for use with `--installed`
* `-d, --[no-]details`              - Display detailed information of gem(s)
* `--[no-]versions`             - Display only gem names
* `-a, --all`                       - Display all gem versions
* `-e, --exact`                     - Name of gem(s) to query on matches the provided STRING
* `--[no-]prerelease`           - Display prerelease versions

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *REGEXP* -         regexp to search for in gem name

### Description

The search command displays remote gems whose name matches the given
regexp.

The --details option displays additional details from the gem but will
take a little longer to complete as it must download the information
individually from the index.

To list local gems use the list command.

## gem server

Starts up a web server that hosts the RDoc (requires rubygems-server)

### Usage

    gem server [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The server command has been moved to the rubygems-server gem.

## gem signin

Sign in to any gemcutter-compatible host. It defaults to https://rubygems.org

### Usage

    gem signin [options]

### Options

* `--host HOST`                 - Push to another gemcutter-compatible host
* `--otp CODE`                  - Digit code for multifactor authentication You can also use the environment variable GEM_HOST_OTP_CODE

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The signin command executes host sign in for a push server (the default is https://rubygems.org). The host can be provided with the host flag or can be inferred from the provided gem. Host resolution matches the resolution strategy for the push command.

## gem signout

Sign out from all the current sessions.

### Usage

    gem signout [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The `signout` command is used to sign out from all current sessions, allowing you to sign in using a different set of credentials.

## gem sources

Manage the sources and cache file RubyGems uses to search for gems

### Usage

    gem sources [options]

### Options

* `-a, --add SOURCE_URI`            - Add source
* `-l, --list`                      - List sources
* `-r, --remove SOURCE_URI`         - Remove source
* `-c, --clear-all`                 - Remove all sources (clear the cache)
* `-u, --update`                    - Update source cache
* `-f, --[no-]force`                - Do not show any confirmation prompts and behave as if 'yes' was always answered

### Local/Remote Options

* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

RubyGems fetches gems from the sources you have configured (stored in your
~/.gemrc).

The default source is https://rubygems.org, but you may have other sources
configured.  This guide will help you update your sources or configure
yourself to use your own gem server.

Without any arguments the sources lists your currently configured sources:

    $ gem sources
    *** CURRENT SOURCES ***

    https://rubygems.org

This may list multiple sources or non-rubygems sources.  You probably
configured them before or have an old `~/.gemrc`.  If you have sources you
do not recognize you should remove them.

RubyGems has been configured to serve gems via the following URLs through
its history:

* http://gems.rubyforge.org (RubyGems 1.3.5 and earlier)
* http://rubygems.org       (RubyGems 1.3.6 through 1.8.30, and 2.0.0)
* https://rubygems.org      (RubyGems 2.0.1 and newer)

Since all of these sources point to the same set of gems you only need one
of them in your list.  https://rubygems.org is recommended as it brings the
protections of an SSL connection to gem downloads.

To add a source use the --add argument:

      $ gem sources --add https://rubygems.org
      https://rubygems.org added to sources

RubyGems will check to see if gems can be installed from the source given
before it is added.

To remove a source use the --remove argument:

      $ gem sources --remove https://rubygems.org/
      https://rubygems.org/ removed from sources

## gem specification

Display gem specification (in yaml)

### Usage

    gem specification [GEMFILE] [FIELD] [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to examine
* `--platform PLATFORM`         - Specify the platform of gem to specification
* `--[no-]prerelease`           - Allow prerelease versions of a gem
* `--all`                       - Output specifications for all versions of the gem
* `--ruby`                      - Output ruby format
* `--yaml`                      - Output YAML format
* `--marshal`                   - Output Marshal format

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMFILE* -        name of gem to show the gemspec for
* *FIELD* -          name of gemspec field to show

### Description

The specification command allows you to extract the specification from
a gem for examination.

The specification can be output in YAML, ruby or Marshal formats.

Specific fields in the specification can be extracted in YAML format:

    $ gem spec rake summary
    --- Ruby based make-like utility.
    ...

## gem stale

List gems along with access times

### Usage

    gem stale [options]

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Description

The stale command lists the latest access time for all the files in your
installed gems.

You can use this command to discover gems and gem versions you are no
longer using.

## gem uninstall

Uninstall gems from the local repository

### Usage

    gem uninstall GEMNAME [GEMNAME ...] [options]

### Options

* `-a, --[no-]all`                  - Uninstall all matching versions
* `-I, --[no-]ignore-dependencies`  - Ignore dependency requirements while uninstalling
* `-D, --[no-]check-development`    - Check development dependencies while uninstalling (default: false)
* `-x, --[no-]executables`          - Uninstall applicable executables without confirmation
* `-i, --install-dir DIR`           - Directory to uninstall gem from
* `-n, --bindir DIR`                - Directory to remove executables from
* `--[no-]user-install`         - Uninstall from user's home directory in addition to GEM_HOME.
* `--[no-]format-executable`    - Assume executable names match Ruby's prefix and suffix.
* `--[no-]force`                - Uninstall all versions of the named gems ignoring dependencies
* `--[no-]abort-on-dependent`   - Prevent uninstalling gems that are depended on by other gems.
* `-v, --version VERSION`           - Specify version of gem to uninstall
* `--platform PLATFORM`         - Specify the platform of gem to uninstall
* `--vendor`                    - Uninstall gem from the vendor directory. Only for use by gem repackagers.

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to uninstall

### Description

The uninstall command removes a previously installed gem.

RubyGems will ask for confirmation if you are attempting to uninstall a gem
that is a dependency of an existing gem.  You can use the
--ignore-dependencies option to skip this check.

## gem unpack

Unpack an installed gem to the current directory

### Usage

    gem unpack GEMNAME [options]

### Options

* `--target=DIR`                - target directory for unpacking
* `--spec`                      - unpack the gem specification
* `-v, --version VERSION`           - Specify version of gem to unpack

### Install/Update Options

* `-P, --trust-policy POLICY`       - Specify gem trust policy

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to unpack

### Description

The unpack command allows you to examine the contents of a gem or modify
them to help diagnose a bug.

You can add the contents of the unpacked gem to the load path using the
RUBYLIB environment variable or -I:

    $ gem unpack my_gem
    Unpacked gem: '.../my_gem-1.0'
    [edit my_gem-1.0/lib/my_gem.rb]
    $ ruby -Imy_gem-1.0/lib -S other_program

You can repackage an unpacked gem using the build command.  See the build
command help for an example.

## gem update

Update installed gems to the latest version

### Usage

    gem update GEMNAME [GEMNAME ...] [options]

### Options

* `--system [VERSION]`          - Update the RubyGems system software
* `--platform PLATFORM`         - Specify the platform of gem to update
* `--[no-]prerelease`           - Allow prerelease versions of a gem as update targets

### Deprecated Options

* `-u, --[no-]update-sources`       - Update local source cache

### Install/Update Options

* `-i, --install-dir DIR`           - Gem repository directory to get installed gems
* `-n, --bindir DIR`                - Directory where executables will be placed when the gem is installed
* `--document [TYPES]`          - Generate documentation for installed gems List the documentation types you wish to generate.  For example: rdoc,ri
* `--build-root DIR`            - Temporary installation root. Useful for building packages. Do not use this when installing remote gems.
* `--vendor`                    - Install gem into the vendor directory. Only for use by gem repackagers.
* `-N, --no-document`               - Disable documentation generation
* `-E, --[no-]env-shebang`          - Rewrite the shebang line on installed scripts to use /usr/bin/env
* `-f, --[no-]force`                - Force gem to install, bypassing dependency checks
* `-w, --[no-]wrappers`             - Use bin wrappers for executables Not available on dosish platforms
* `-P, --trust-policy POLICY`       - Specify gem trust policy
* `--ignore-dependencies`       - Do not install any required dependent gems
* `--[no-]format-executable`    - Make installed executable names match Ruby. If Ruby is ruby18, foo_exec will be foo_exec18
* `--[no-]user-install`         - Install in user's home directory instead of GEM_HOME.
* `--development`               - Install additional development dependencies
* `--development-all`           - Install development dependencies for all gems (including dev deps themselves)
* `--conservative`              - Don't attempt to upgrade gems already meeting version requirement
* `--[no-]minimal-deps`         - Don't upgrade any dependencies that already meet version requirements
* `--[no-]post-install-message` - Print post install message
* `-g, --file [FILE]`               - Read from a gem dependencies API file and install the listed gems
* `--without GROUPS`            - Omit the named groups (comma separated) when installing from a gem dependencies file
* `--default`                   - Add the gem's full specification to specifications/default and extract only its bin
* `--explain`                   - Rather than install the gems, indicate which would be installed
* `--[no-]lock`                 - Create a lock file (when used with `-g`/`--file`)
* `--[no-]suggestions`          - Suggest alternates when gems are not found

### Local/Remote Options

* `-l, --local`                     - Restrict operations to the LOCAL domain
* `-r, --remote`                    - Restrict operations to the REMOTE domain
* `-b, --both`                      - Allow LOCAL and REMOTE operations
* `-B, --bulk-threshold COUNT`      - Threshold for switching to bulk synchronization (default 1000)
* `--clear-sources`             - Clear the gem sources
* `-s, --source URL`                - Append URL to list of remote gem sources
* `-p, --[no-]http-proxy [URL]`     - Use HTTP proxy for remote operations

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEMNAME* -        name of gem to update

### Description

The update command will update your gems to the latest version.

The update command does not remove the previous version. Use the cleanup
command to remove old versions.

## gem which

Find the location of a library file you can require

### Usage

    gem which FILE [FILE ...] [options]

### Options

* `-a, --[no-]all`                  - show all matching files
* `-g, --[no-]gems-first`           - search gems before non-gems

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *FILE* -           name of file to find

### Description

The which command is like the shell which command and shows you where
the file you wish to require lives.

You can use the which command to help determine why you are requiring a
version you did not expect or to look at the content of a file you are
requiring to see why it does not behave as you expect.

## gem yank

Remove a pushed gem from the index

### Usage

    gem yank -v VERSION [-p PLATFORM] [--key KEY_NAME] [--host HOST] GEM [options]

### Options

* `-v, --version VERSION`           - Specify version of gem to remove
* `--platform PLATFORM`         - Specify the platform of gem to remove
* `--otp CODE`                  - Digit code for multifactor authentication You can also use the environment variable GEM_HOST_OTP_CODE
* `--host HOST`                 - Yank from another gemcutter-compatible host (e.g. https://rubygems.org)
* `-k, --key KEYNAME`               - Use the given API key from ~/.local/share/gem/credentials

### Common Options

* `-h, --help`                      - Get help on this command
* `-V, --[no-]verbose`              - Set the verbose level of output
* `-q, --quiet`                     - Silence command progress meter
* `--silent`                    - Silence RubyGems output
* `--config-file FILE`          - Use this config file instead of default
* `--backtrace`                 - Show stack backtrace on errors
* `--debug`                     - Turn on Ruby debugging
* `--norc`                      - Avoid loading any .gemrc file

### Arguments

* *GEM* -        name of gem

### Description

The yank command permanently removes a gem you pushed to a server.

Once you have pushed a gem several downloads will happen automatically
via the webhooks. If you accidentally pushed passwords or other sensitive
data you will need to change them immediately and yank your gem.
