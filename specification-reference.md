---
layout: default
title: Specification Reference
url: /specification-refence
previous: /patterns
next: /command-reference
---

The Specification class contains the
information for a Gem.  Typically defined in a .gemspec file or a Rakefile,
and looks like this:

    Gem::Specification.new do |s|
      s.name        = 'example'
      s.version     = '0.1.0'
      s.licenses    = ['MIT']
      s.summary     = "This is an example!"
      s.description = "Much longer explanation of the example!"
      s.authors     = ["Ruby Coder"]
      s.email       = 'rubycoder@example.com'
      s.files       = ["lib/example.rb"]
      s.homepage    = 'https://rubygems.org/gems/example'
    end

Starting in RubyGems 2.0, a Specification
can hold arbitrary metadata.  See metadata for
restrictions on the format and size of metadata items you may add to a
specification.

## Required gemspec attributes

* [author=](#author=)
* [authors=](#authors=)
* [files](#files)
* [name](#name)
* [platform=](#platform=)
* [require_paths=](#require_paths=)
* [rubygems_version](#rubygems_version)
* [summary](#summary)
* [version](#version)

## Recommended gemspec attributes

* [license=](#license=)
* [licenses=](#licenses=)

## Optional gemspec attributes

* [add_development_dependency](#add_development_dependency)
* [add_runtime_dependency](#add_runtime_dependency)
* [bindir](#bindir)
* [cert_chain](#cert_chain)
* [description](#description)
* [email](#email)
* [executables](#executables)
* [extensions](#extensions)
* [extra_rdoc_files](#extra_rdoc_files)
* [homepage](#homepage)
* [metadata](#metadata)
* [post_install_message](#post_install_message)
* [rdoc_options](#rdoc_options)
* [required_ruby_version](#required_ruby_version)
* [required_ruby_version=](#required_ruby_version=)
* [required_rubygems_version](#required_rubygems_version)
* [required_rubygems_version=](#required_rubygems_version=)
* [requirements](#requirements)
* [signing_key](#signing_key)

# Required gemspec attributes

<a id="author="> </a>

## author=(`o`)

Singular writer for authors

Usage:

    spec.author = 'John Jones'

<a id="authors="> </a>

## authors=(`value`)

Sets the list of authors, ensuring it is an array.

Usage:

    spec.authors = ['John Jones', 'Mary Smith']

<a id="files"> </a>

## files

Files included in this gem.  You cannot append to this accessor, you must
assign to it.

Only add files you can require to this list, not directories, etc.

Directories are automatically stripped from this list when building a gem,
other non-files cause an error.

Usage:

    require 'rake'
    spec.files = FileList['lib     .rb',
                          'bin/*',
                          '[A-Z]*',
                          'test/   *'].to_a

    # or without Rake...
    spec.files = Dir['lib/   *.rb'] + Dir['bin/*']
    spec.files += Dir['[A-Z]*'] + Dir['test/**/*']
    spec.files.reject! { |fn| fn.include? "CVS" }

<a id="name"> </a>

## name

This gem's name.

Usage:

    spec.name = 'rake'

<a id="platform="> </a>

## platform=(`platform`)

The platform this gem runs on.

This is usually `Gem::Platform::RUBY` or `Gem::Platform::CURRENT`.

Most gems contain pure Ruby code; they should simply leave the default
value in place.  Some gems contain C (or other) code to be compiled into a
Ruby “extension”.  The gem should leave the default value in place unless
the code will only compile on a certain type of system.  Some gems consist
of pre-compiled code (“binary gems”).  It's especially important that
they set the platform attribute appropriately.  A shortcut is to set the
platform to Gem::Platform::CURRENT, which will cause the gem builder to set
the platform to the appropriate value for the system on which the build is
being performed.

If this attribute is set to a non-default value, it will be included in the
filename of the gem when it is built such as:
nokogiri-1.6.0-x86-mingw32.gem

Usage:

    spec.platform = Gem::Platform.local

<a id="require_paths="> </a>

## require_paths=(`val`)

Paths in the gem to add to `$LOAD_PATH` when this gem is
activated.

See also require_paths

If you have an extension you do not need to add
`"ext"` to the require path, the extension build
process will copy the extension files into “lib” for you.

The default value is `"lib"`

Usage:

    # If all library files are in the root directory...
    spec.require_paths = ['.']

<a id="rubygems_version"> </a>

## rubygems_version

The version of RubyGems used to create this gem.

Do not set this, it is set automatically when the gem is packaged.

<a id="summary"> </a>

## summary

A short summary of this gem's description.  Displayed in `gem list -d`.

The description
should be more detailed than the summary.

Usage:

    spec.summary = "This is a small summary of my gem"

<a id="version"> </a>

## version

This gem's version.

The version string can contain numbers and periods, such as
`1.0.0`. A gem is a 'prerelease' gem if the version has
a letter in it, such as `1.0.0.pre`.

Usage:

    spec.version = '0.4.1'

# Recommended gemspec attributes

<a id="license="> </a>

## license=(`o`)

The license for this gem.

The license must be no more than 64 characters.

This should just be the name of your license. The full text of the license
should be inside of the gem (at the top level) when you build it.

The simplest way, is to specify the standard SPDX ID <a
href="https://spdx.org/licenses">spdx.org/licenses</a>/ for the license.
Ideally you should pick one that is OSI (Open Source Initiative) <a
href="http://opensource.org/licenses/alphabetical">opensource.org/licenses/alphabetical</a>
approved.

The most commonly used OSI approved licenses are BSD-3-Clause and MIT.
GitHub also provides a license picker at <a
href="http://choosealicense.com">choosealicense.com</a>/.

You should specify a license for your gem so that people know how they are
permitted to use it, and any restrictions you're placing on it.  Not
specifying a license means all rights are reserved; others have no rights
to use the code for any purpose.

You can set multiple licenses with licenses=

Usage:

    spec.license = 'MIT'

<a id="licenses="> </a>

## licenses=(`licenses`)

The license(s) for the library.

Each license must be a short name, no more than 64 characters.

This should just be the name of your license. The full text of the license
should be inside of the gem when you build it.

See license= for more
discussion

Usage:

    spec.licenses = ['MIT', 'GPL-2']

# Optional gemspec attributes

<a id="add_development_dependency"> </a>

## add_development_dependency(`gem`, `*requirements`)

Adds a development dependency named `gem` with
`requirements` to this gem.

Usage:

    spec.add_development_dependency 'example', '~> 1.1', '>= 1.1.4'

Development dependencies aren't installed by default and aren't
activated when a gem is required.

<a id="add_runtime_dependency"> </a>

## add_runtime_dependency(`gem`, `*requirements`)

Adds a runtime dependency named `gem` with
`requirements` to this gem.

Usage:

    spec.add_runtime_dependency 'example', '~> 1.1', '>= 1.1.4'

<a id="bindir"> </a>

## bindir

The path in the gem for executable scripts.  Usually 'bin'

Usage:

    spec.bindir = 'bin'

<a id="cert_chain"> </a>

## cert_chain

The certificate chain used to sign this gem.  See Gem::Security for
details.

<a id="description"> </a>

## description

A long description of this gem

The description should be more detailed than the summary but not
excessively long.  A few paragraphs is a recommended length with no
examples or formatting.

Usage:

    spec.description = <<-EOF
      Rake is a Make-like program implemented in Ruby. Tasks and
      dependencies are specified in standard Ruby syntax.
    EOF

<a id="email"> </a>

## email

A contact email address (or addresses) for this gem

Usage:

    spec.email = 'john.jones@example.com'
    spec.email = ['jack@example.com', 'jill@example.com']

<a id="executables"> </a>

## executables

Executables included in the gem.

For example, the rake gem has rake as an executable. You don’t specify the
full path (as in bin/rake); all application-style files are expected to be
found in bindir.  These files must be executable Ruby files.  Files that
use bash or other interpreters will not work.

Executables included may only be ruby scripts, not scripts for other
languages or compiled binaries.

Usage:

    spec.executables << 'rake'

<a id="extensions"> </a>

## extensions

Extensions to build when installing the gem, specifically the paths to
extconf.rb-style files used to compile extensions.

These files will be run when the gem is installed, causing the C (or
whatever) code to be compiled on the user’s machine.

Usage:

    spec.extensions << 'ext/rmagic/extconf.rb'

See Gem::Ext::Builder for information about writing extensions for gems.

<a id="extra_rdoc_files"> </a>

## extra_rdoc_files

Extra files to add to RDoc such as README or doc/examples.txt

When the user elects to generate the RDoc documentation for a gem
(typically at install time), all the library files are sent to RDoc for
processing. This option allows you to have some non-code files included for
a more complete set of documentation.

Usage:

    spec.extra_rdoc_files = ['README', 'doc/user-guide.txt']

<a id="homepage"> </a>

## homepage

The URL of this gem's home page

Usage:

    spec.homepage = 'http://rake.rubyforge.org'

<a id="metadata"> </a>

## metadata

:attr_accessor: metadata

The metadata holds extra data for this gem that may be useful to other
consumers and is settable by gem authors without requiring an update to the
rubygems software.

Metadata items have the following restrictions:

* The metadata must be a Hash object
* All keys and values must be Strings
* Keys can be a maximum of 128 bytes and values can be a maximum of 1024 bytes
* All strings must be UTF-8, no binary data is allowed

To add metadata for the location of a issue tracker:

    s.metadata = { "issue_tracker" => "https://example/issues" }

<a id="post_install_message"> </a>

## post_install_message

A message that gets displayed after the gem is installed.

Usage:

    spec.post_install_message = "Thanks for installing!"

<a id="rdoc_options"> </a>

## rdoc_options

Specifies the rdoc options to be used when generating API documentation.

Usage:

    spec.rdoc_options << '--title' << 'Rake -- Ruby Make' <<
      '--main' << 'README' <<
      '--line-numbers'

<a id="required_ruby_version"> </a>

## required_ruby_version

The version of Ruby required by this gem

<a id="required_ruby_version="> </a>

## required_ruby_version=(`req`)

The version of Ruby required by this gem.  The ruby version can be
specified to the patch-level:

    $ ruby -v -e 'p Gem.ruby_version'
    ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
    #<Gem::Version "2.0.0.247">

Usage:

    # This gem will work with 1.8.6 or greater...
    spec.required_ruby_version = '>= 1.8.6'

    # Only with ruby 2.0.x
    spec.required_ruby_version = '~> 2.0'

<a id="required_rubygems_version"> </a>

## required_rubygems_version

The RubyGems version required by this gem

<a id="required_rubygems_version="> </a>

## required_rubygems_version=(`req`)

The RubyGems version required by this gem

<a id="requirements"> </a>

## requirements

Lists the external (to RubyGems) requirements that must be met for this gem
to work.  It's simply information for the user.

Usage:

    spec.requirements << 'libmagick, v6.0'
    spec.requirements << 'A good graphics card'

<a id="signing_key"> </a>

## signing_key

The key used to sign this gem.  See Gem::Security for details.
