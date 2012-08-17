---
layout: default
title: Command Reference
previous: /patterns
next: /rubygems-org-api
---

What each `gem` command does, and how to use it.

* [gem build](#gem_build)
* [gem cert](#gem_cert)
* [gem check](#gem_check)
* [gem cleanup](#gem_cleanup)
* [gem contents](#gem_contents)
* [gem dependency](#gem_dependency)
* [gem environment](#gem_environment)
* [gem fetch](#gem_fetch)
* [gem generate_index](#gem_generate_index)
* [gem help](#gem_help)
* [gem install](#gem_install)
* [gem list](#gem_list)
* [gem lock](#gem_lock)
* [gem outdated](#gem_outdated)
* [gem owner](#gem_owner)
* [gem pristine](#gem_pristine)
* [gem push](#gem_push)
* [gem query](#gem_query)
* [gem rdoc](#gem_rdoc)
* [gem search](#gem_search)
* [gem server](#gem_server)
* [gem sources](#gem_sources)
* [gem specification](#gem_specification)
* [gem stale](#gem_stale)
* [gem uninstall](#gem_uninstall)
* [gem unpack](#gem_unpack)
* [gem update](#gem_update)
* [gem which](#gem_which)



## gem build

Build a gem from a gemspec

### Usage

    gem build GEMSPEC_FILE [options]


###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMSPEC_FILE* -   gemspec file name to build a gem for

  

  

## gem cert

Manage RubyGems certificates and signing settings

### Usage

    gem cert [options]


###   Options:

*     -a, -&#8203;-add CERT                 - Add a trusted certificate.
*     -l, -&#8203;-list                     - List trusted certificates.
*     -r, -&#8203;-remove STRING            - Remove trusted certificates containing STRING.
*     -b, -&#8203;-build EMAIL_ADDR         - Build private key and self-signed certificate for EMAIL_ADDR.
*     -C, -&#8203;-certificate CERT         - Certificate for -&#8203;-sign command.
*     -K, -&#8203;-private-key KEY          - Private key for -&#8203;-sign command.
*     -s, -&#8203;-sign NEWCERT             - Sign a certificate with my key and certificate.

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem check

Check installed gems

### Usage

    gem check [options]


###   Options:

*         -&#8203;-verify FILE              - Verify gem file against its internal checksum
*     -a, -&#8203;-alien                    - Report 'unmanaged' or rogue files in the gem repository
*     -v, -&#8203;-version VERSION          - Specify version of gem to check

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem cleanup

Clean up old versions of installed gems in the local repository

### Usage

    gem cleanup [GEMNAME ...] [options]


###   Options:

*   - -d, -&#8203;-dryrun

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to cleanup

  

  
### Description

The cleanup command removes old gems from GEM_HOME.  If an older version is
installed elsewhere in GEM_PATH the cleanup command won't touch it.
  

## gem contents

Display the contents of the installed gems

### Usage

    gem contents GEMNAME [GEMNAME ...] [options]


###   Options:

*     -v, -&#8203;-version VERSION          - Specify version of gem to contents
*         -&#8203;-all                      - Contents for all gems
*     -s, -&#8203;-spec-dir a,b,c           - Search for gems under specific paths
*     -l, -&#8203;-\[no-\]lib-only            - Only return files in the Gem's lib_dirs
*         -&#8203;-\[no-\]prefix              - Don't include installed path prefix

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to list contents for

  

  

## gem dependency

Show the dependencies of an installed gem

### Usage

    gem dependency GEMNAME [options]


###   Options:

*     -v, -&#8203;-version VERSION          - Specify version of gem to dependency
*         -&#8203;-platform PLATFORM        - Specify the platform of gem to dependency
*         -&#8203;-\[no-\]prerelease          - Allow prerelease versions of a gem
*   - -R, -&#8203;-\[no-\]reverse-dependencies  Include reverse dependencies in the output
*         -&#8203;-pipe                     - Pipe Format (name -&#8203;-version ver)

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to show dependencies for

  

  

## gem environment

Display information about the RubyGems environment

### Usage

    gem environment [arg] [options]


###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *packageversion* -   display the package version
* *gemdir* -           display the path where gems are installed
* *gempath* -          display path used to search for gems
* *version* -          display the gem format version
* *remotesources* -    display the remote gem servers
* *platform* -         display the supported gem platforms
* *&lt;omitted&gt;* -        display everything

  

  
### Description

The RubyGems environment can be controlled through command line arguments,
gemrc files, environment variables and built-in defaults.

Command line argument defaults and some RubyGems defaults can be set in
~/.gemrc file for individual users and a /etc/gemrc for all users.  A gemrc
is a YAML file with the following YAML keys:

    :sources: A YAML array of remote gem repositories to install gems from
    :verbose: Verbosity of the gem command.  false, true, and :really are the
              levels
    :update_sources: Enable/disable automatic updating of repository metadata
    :backtrace: Print backtrace when RubyGems encounters an error
    :gempath: The paths in which to look for gems
    gem_command: A string containing arguments for the specified gem command

Example:

    :verbose: false
    install: --no-wrappers
    update: --no-wrappers

RubyGems' default local repository can be overridden with the GEM_PATH and
GEM_HOME environment variables.  GEM_HOME sets the default repository to
install into.  GEM_PATH allows multiple local repositories to be searched for
gems.

If you are behind a proxy server, RubyGems uses the HTTP_PROXY,
HTTP_PROXY_USER and HTTP_PROXY_PASS environment variables to discover the
proxy server.

If you are packaging RubyGems all of RubyGems' defaults are in
lib/rubygems/defaults.rb.  You may override these in
lib/rubygems/defaults/operating_system.rb
  

## gem fetch

Download a gem and place it in the current directory

### Usage

    gem fetch GEMNAME [GEMNAME ...] [options]


###   Options:

*     -v, -&#8203;-version VERSION          - Specify version of gem to fetch
*         -&#8203;-platform PLATFORM        - Specify the platform of gem to fetch
*         -&#8203;-\[no-\]prerelease          - Allow prerelease versions of a gem

###   Local/Remote Options:

*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations
*         -&#8203;-source URL               - Add URL as a remote source for gems

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to download

  

  

## gem generate_index

Generates the index files for a gem server directory

### Usage

    gem generate_index [options]


###   Options:

*     -d, -&#8203;-directory=DIRNAME        - repository base dir containing gems subdir
*         -&#8203;-\[no-\]legacy              - Generate Marshal.4.8
*         -&#8203;-\[no-\]modern              - Generate indexes for RubyGems newer than 1.2.0
*         -&#8203;-update                   - Update modern indexes with gems added since the last update

###   RSS Options:

*         -&#8203;-rss-gems-host=GEM_HOST   - Host name where gems are served from, used for GUID and enclosure values
*         -&#8203;-rss-host=HOST            - Host name for more gems information, used for RSS feed link
*         -&#8203;-rss-title=TITLE          - Set title for RSS feed

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  
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

    # these files support legacy RubyGems
    Marshal.<version>
    Marshal.<version>.Z                          # Marshal full index

The .Z and .rz extension files are compressed with the inflate algorithm.
The Marshal version number comes from ruby's Marshal::MAJOR_VERSION and
Marshal::MINOR_VERSION constants.  It is used to ensure compatibility.

If --rss-host and --rss-gem-host are given an RSS feed will be generated at
index.rss containing gems released in the last two days.
  

## gem help

Provide help on the 'gem' command

### Usage

    gem help ARGUMENT [options]


###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *commands* -       List all 'gem' commands
* *examples* -       Show examples of 'gem' usage
* *&lt;command&gt;* -      Show specific help for &lt;command&gt;

  

  

## gem install

Install a gem into the local repository

### Usage

    gem install GEMNAME [GEMNAME ...] [options] -- --build-flags [options]


###   Options:

*         -&#8203;-platform PLATFORM        - Specify the platform of gem to install
*     -v, -&#8203;-version VERSION          - Specify version of gem to install
*         -&#8203;-\[no-\]prerelease          - Allow prerelease versions of a gem to be installed. (Only for listed gems)

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Install/Update Options:

*     -i, -&#8203;-install-dir DIR          - Gem repository directory to get installed gems
*     -n, -&#8203;-bindir DIR               - Directory where binary files are located
*     -d, -&#8203;-\[no-\]rdoc                - Generate RDoc documentation for the gem on install
*         -&#8203;-\[no-\]ri                  - Generate RI documentation for the gem on install
*     -E, -&#8203;-\[no-\]env-shebang         - Rewrite the shebang line on installed scripts to use /usr/bin/env
*     -f, -&#8203;-\[no-\]force               - Force gem to install, bypassing dependency checks
*     -w, -&#8203;-\[no-\]wrappers            - Use bin wrappers for executables Not available on dosish platforms
*     -P, -&#8203;-trust-policy POLICY      - Specify gem trust policy
*         -&#8203;-ignore-dependencies      - Do not install any required dependent gems
*     -y, -&#8203;-include-dependencies     - Unconditionally install the required dependent gems
*         -&#8203;-\[no-\]format-executable   - Make installed executable names match ruby. If ruby is ruby18, foo_exec will be foo_exec18
*         -&#8203;-\[no-\]user-install        - Install in user's home directory instead of GEM_HOME.
*         -&#8203;-development              - Install any additional development dependencies
*         -&#8203;-conservative             - Don't attempt to upgrade gems already meeting version requirement

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to install

  

  
### Description

The install command installs local or remote gem into a gem repository.

For gems with executables ruby installs a wrapper file into the executable
directory by default.  This can be overridden with the --no-wrappers option.
The wrapper allows you to choose among alternate gem versions using _version_.

For example `rake _0.7.3_ --version` will run rake version 0.7.3 if a newer
version is also installed.

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
  

## gem list

Display gems whose name starts with STRING

### Usage

    gem list [STRING] [options]


###   Options:

*     -i, -&#8203;-\[no-\]installed           - Check for installed gem
*     -v, -&#8203;-version VERSION          - Specify version of gem to list for use with -&#8203;-installed
*     -d, -&#8203;-\[no-\]details             - Display detailed information of gem(s)
*         -&#8203;-\[no-\]versions            - Display only gem names
*     -a, -&#8203;-all                      - Display all gem versions
*         -&#8203;-\[no-\]prerelease          - Display prerelease versions

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *STRING* -         start of gem name to look for

  

  

## gem lock

Generate a lockdown list of gems

### Usage

    gem lock GEMNAME-VERSION [GEMNAME-VERSION ...] [options]


###   Options:

*     -s, -&#8203;-\[no-\]strict              - fail if unable to satisfy a dependency

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
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

    gemlock rails-1.0.0 > lockdown.rb

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
  

## gem outdated

Display all gems that need updates

### Usage

    gem outdated [options]


###   Options:

*         -&#8203;-platform PLATFORM        - Specify the platform of gem to outdated

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem owner

Manage gem owners on RubyGems.org.

### Usage

    gem owner [options]


###   Options:

*     -k, -&#8203;-key KEYNAME              - Use the given API key from ~/.gem/credentials
*     -a, -&#8203;-add EMAIL                - Add an owner
*     -r, -&#8203;-remove EMAIL             - Remove an owner

###   Local/Remote Options:

*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEM* -        gem to manage owners for

  

  
### Description

Manage gem owners on RubyGems.org.
  

## gem pristine

Restores installed gems to pristine condition from files located in the gem cache

### Usage

    gem pristine [args] [options]


###   Options:

*         -&#8203;-all                      - Restore all installed gems to pristine condition
*         -&#8203;-\[no-\]extensions          - Restore gems with extensions
*     -v, -&#8203;-version VERSION          - Specify version of gem to restore to pristine condition

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        gem to restore to pristine condition (unless --all)

  

  
### Description

The pristine command compares the installed gems with the contents of the
cached gem and restores any files that don't match the cached gem's copy.

If you have made modifications to your installed gems, the pristine command
will revert them.  After all the gem's files have been checked all bin stubs
for the gem are regenerated.

If the cached gem cannot be found, you will need to use `gem install` to
revert the gem.

If --no-extensions is provided pristine will not attempt to restore gems with
extensions.
  

## gem push

Push a gem up to RubyGems.org

### Usage

    gem push GEM [options]


###   Options:

*     -k, -&#8203;-key KEYNAME              - Use the given API key from ~/.gem/credentials
*         -&#8203;-host HOST                - Push to another gemcutter-compatible host

###   Local/Remote Options:

*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEM* -        built gem to push up

  

  
### Description

Push a gem up to RubyGems.org
  

## gem query

Query gem information in local or remote repositories

### Usage

    gem query [options]


###   Options:

*     -i, -&#8203;-\[no-\]installed           - Check for installed gem
*     -v, -&#8203;-version VERSION          - Specify version of gem to query for use with -&#8203;-installed
*     -n, -&#8203;-name-matches REGEXP      - Name of gem(s) to query on matches the provided REGEXP
*     -d, -&#8203;-\[no-\]details             - Display detailed information of gem(s)
*         -&#8203;-\[no-\]versions            - Display only gem names
*     -a, -&#8203;-all                      - Display all gem versions
*         -&#8203;-\[no-\]prerelease          - Display prerelease versions

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem rdoc

Generates RDoc for pre-installed gems

### Usage

    gem rdoc [args] [options]


###   Options:

*         -&#8203;-all                      - Generate RDoc/RI documentation for all installed gems
*         -&#8203;-\[no-\]rdoc                - Generate RDoc HTML
*         -&#8203;-\[no-\]ri                  - Generate RI data
*         -&#8203;-\[no-\]overwrite           - Overwrite installed documents
*     -v, -&#8203;-version VERSION          - Specify version of gem to rdoc

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        gem to generate documentation for (unless --all)

  

  
### Description

The rdoc command builds RDoc and RI documentation for installed gems.  Use
--overwrite to force rebuilding of documentation.
  

## gem search

Display all gems whose name contains STRING

### Usage

    gem search [STRING] [options]


###   Options:

*     -i, -&#8203;-\[no-\]installed           - Check for installed gem
*     -v, -&#8203;-version VERSION          - Specify version of gem to search for use with -&#8203;-installed
*     -d, -&#8203;-\[no-\]details             - Display detailed information of gem(s)
*         -&#8203;-\[no-\]versions            - Display only gem names
*     -a, -&#8203;-all                      - Display all gem versions
*         -&#8203;-\[no-\]prerelease          - Display prerelease versions

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *STRING* -         fragment of gem name to search for

  

  

## gem server

Documentation and gem repository HTTP server

### Usage

    gem server [options]


###   Options:

*     -p, -&#8203;-port=PORT                - port to listen on
*     -d, -&#8203;-dir=GEMDIR               - directories from which to serve gems multiple directories may be provided
*         -&#8203;-\[no-\]daemon              - run as a daemon
*     -b, -&#8203;-bind=HOST,HOST           - addresses to bind
*     -l, -&#8203;-launch\[=COMMAND\]         - launches a browser window COMMAND defaults to 'start' on Windows and 'open' on all other platforms

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  
### Description

The server command starts up a web server that hosts the RDoc for your
installed gems and can operate as a server for installation of gems on other
machines.

The cache files for installed gems must exist to use the server as a source
for gem installation.

To install gems from a running server, use `gem install GEMNAME --source
http://gem_server_host:8808`

You can set up a shortcut to gem server documentation using the URL:

    http://localhost:8808/rdoc?q=%s - Firefox
    http://localhost:8808/rdoc?q=* - LaunchBar
  

## gem sources

Manage the sources and cache file RubyGems uses to search for gems

### Usage

    gem sources [options]


###   Options:

*     -a, -&#8203;-add SOURCE_URI           - Add source
*     -l, -&#8203;-list                     - List sources
*     -r, -&#8203;-remove SOURCE_URI        - Remove source
*     -c, -&#8203;-clear-all                - Remove all sources (clear the cache)
*     -u, -&#8203;-update                   - Update source cache

###   Local/Remote Options:

*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem specification

Display gem specification (in yaml)

### Usage

    gem specification [GEMFILE] [FIELD] [options]


###   Options:

*     -v, -&#8203;-version VERSION          - Specify version of gem to examine
*         -&#8203;-platform PLATFORM        - Specify the platform of gem to specification
*         -&#8203;-all                      - Output specifications for all versions of the gem
*         -&#8203;-ruby                     - Output ruby format
*         -&#8203;-yaml                     - Output RUBY format
*         -&#8203;-marshal                  - Output Marshal format

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMFILE* -        name of gem to show the gemspec for
* *FIELD* -          name of gemspec field to show

  

  

## gem stale

List gems along with access times

### Usage

    gem stale [options]


###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  

  

## gem uninstall

Uninstall gems from the local repository

### Usage

    gem uninstall GEMNAME [GEMNAME ...] [options]


###   Options:

*     -a, -&#8203;-\[no-\]all                 - Uninstall all matching versions
*     -I, -&#8203;-\[no-\]ignore-dependencies - Ignore dependency requirements while uninstalling
*     -x, -&#8203;-\[no-\]executables         - Uninstall applicable executables without confirmation
*     -i, -&#8203;-install-dir DIR          - Directory to uninstall gem from
*     -n, -&#8203;-bindir DIR               - Directory to remove binaries from
*         -&#8203;-\[no-\]user-install        - Uninstall from user's home directory in addition to GEM_HOME.
*         -&#8203;-\[no-\]format-executable   - Assume executable names match Ruby's prefix and suffix.
*     -v, -&#8203;-version VERSION          - Specify version of gem to uninstall
*         -&#8203;-platform PLATFORM        - Specify the platform of gem to uninstall

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to uninstall

  

  

## gem unpack

Unpack an installed gem to the current directory

### Usage

    gem unpack GEMNAME [options]


###   Options:

*         -&#8203;-target=DIR               - target directory for unpacking
*         -&#8203;-spec                     - unpack the gem specification
*     -v, -&#8203;-version VERSION          - Specify version of gem to unpack

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to unpack

  

  

## gem update

Update the named gems (or all installed gems) in the local repository

### Usage

    gem update GEMNAME [GEMNAME ...] [options]


###   Options:

*         -&#8203;-system \[VERSION\]         - Update the RubyGems system software
*         -&#8203;-platform PLATFORM        - Specify the platform of gem to update
*         -&#8203;-\[no-\]prerelease          - Allow prerelease versions of a gem as update targets

###   Deprecated Options:

*     -u, -&#8203;-\[no-\]update-sources      - Update local source cache

###   Install/Update Options:

*     -i, -&#8203;-install-dir DIR          - Gem repository directory to get installed gems
*     -n, -&#8203;-bindir DIR               - Directory where binary files are located
*     -d, -&#8203;-\[no-\]rdoc                - Generate RDoc documentation for the gem on install
*         -&#8203;-\[no-\]ri                  - Generate RI documentation for the gem on install
*     -E, -&#8203;-\[no-\]env-shebang         - Rewrite the shebang line on installed scripts to use /usr/bin/env
*     -f, -&#8203;-\[no-\]force               - Force gem to install, bypassing dependency checks
*     -w, -&#8203;-\[no-\]wrappers            - Use bin wrappers for executables Not available on dosish platforms
*     -P, -&#8203;-trust-policy POLICY      - Specify gem trust policy
*         -&#8203;-ignore-dependencies      - Do not install any required dependent gems
*     -y, -&#8203;-include-dependencies     - Unconditionally install the required dependent gems
*         -&#8203;-\[no-\]format-executable   - Make installed executable names match ruby. If ruby is ruby18, foo_exec will be foo_exec18
*         -&#8203;-\[no-\]user-install        - Install in user's home directory instead of GEM_HOME.
*         -&#8203;-development              - Install any additional development dependencies
*         -&#8203;-conservative             - Don't attempt to upgrade gems already meeting version requirement

###   Local/Remote Options:

*     -l, -&#8203;-local                    - Restrict operations to the LOCAL domain
*     -r, -&#8203;-remote                   - Restrict operations to the REMOTE domain
*     -b, -&#8203;-both                     - Allow LOCAL and REMOTE operations
*     -B, -&#8203;-bulk-threshold COUNT     - Threshold for switching to bulk synchronization (default 1000)
*         -&#8203;-clear-sources            - Clear the gem sources
*         -&#8203;-source URL               - Add URL as a remote source for gems
*     -p, -&#8203;-\[no-\]http-proxy \[URL\]    - Use HTTP proxy for remote operations

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *GEMNAME* -        name of gem to update

  

  

## gem which

Find the location of a library file you can require

### Usage

    gem which FILE [FILE ...] [options]


###   Options:

*     -a, -&#8203;-\[no-\]all                 - show all matching files
*     -g, -&#8203;-\[no-\]gems-first          - search gems before non-gems

###   Common Options:

*     -h, -&#8203;-help                     - Get help on this command
*     -V, -&#8203;-\[no-\]verbose             - Set the verbose level of output
*     -q, -&#8203;-quiet                    - Silence commands
*         -&#8203;-config-file FILE         - Use this config file instead of default
*         -&#8203;-backtrace                - Show stack backtrace on errors
*         -&#8203;-debug                    - Turn on Ruby debugging


  
### Arguments


* *FILE* -           name of file to find

  

  

