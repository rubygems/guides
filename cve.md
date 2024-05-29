---
layout: default
title: RubyGems Common Vulnerabilities and Exposures
url: /cve
previous: /credits
next: /releasing-rubygems
---

# RubyGems Common Vulnerabilities and Exposures

## CVE-2013-4287: Algorithmic complexity vulnerability in RubyGems 2.0.7 and older

RubyGems validates versions with a regular expression that is vulnerable to
denial of service due to backtracking.  For specially crafted RubyGems
versions attackers can cause denial of service through CPU consumption.

RubyGems versions 2.0.7 and older, 2.1.0.rc.1 and 2.1.0.rc.2 are vulnerable.

Ruby versions 1.9.0 through 2.0.0p247 are vulnerable as they contain embedded
versions of RubyGems.

It does not appear to be possible to exploit this vulnerability by installing a
gem for RubyGems 1.8.x or 2.0.x.  Vulnerable uses of RubyGems API include
packaging a gem (through `gem build`, Gem::Package or Gem::PackageTask),
sending user input to Gem::Version.new, Gem::Version.correct? or use of the
Gem::Version::VERSION_PATTERN or Gem::Version::ANCHORED_VERSION_PATTERN
constants.

Notably, users of bundler that install gems from git are vulnerable if a
malicious author changes the gemspec to an invalid version.

The vulnerability can be fixed by changing the first grouping to an atomic
grouping in Gem::Version::VERSION_PATTERN in lib/rubygems/version.rb.  For
RubyGems 2.0.x:

    -  VERSION_PATTERN = '[0-9]+(\.[0-9a-zA-Z]+)*(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?' # :nodoc:
    +  VERSION_PATTERN = '[0-9]+(?>\.[0-9a-zA-Z]+)*(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?' # :nodoc:

For RubyGems 1.8.x:

    -  VERSION_PATTERN = '[0-9]+(\.[0-9a-zA-Z]+)*' # :nodoc:
    +  VERSION_PATTERN = '[0-9]+(?>\.[0-9a-zA-Z]+)*' # :nodoc:

This vulnerability was discovered by Damir Sharipov <dammer2k@gmail.com>

## CVE-2013-4363: Algorithmic complexity vulnerability in RubyGems 2.1.4 and older

The patch for CVE-2013-4287 was insufficiently verified so the combined
regular expression for verifying gem version remains vulnerable following
CVE-2013-4287.

RubyGems validates versions with a regular expression that is vulnerable to
denial of service due to backtracking.  For specially crafted RubyGems
versions attackers can cause denial of service through CPU consumption.

RubyGems versions 2.1.4 and older are vulnerable.

Ruby versions 1.9.0 through 2.0.0p247 are vulnerable as they contain embedded
versions of RubyGems.

It does not appear to be possible to exploit this vulnerability by installing a
gem for RubyGems 1.8.x or newer.  Vulnerable uses of RubyGems API include
packaging a gem (through `gem build`, Gem::Package or Gem::PackageTask),
sending user input to Gem::Version.new, Gem::Version.correct? or use of the
Gem::Version::VERSION_PATTERN or Gem::Version::ANCHORED_VERSION_PATTERN
constants.

Notably, users of bundler that install gems from git are vulnerable if a
malicious author changes the gemspec to an invalid version.

The vulnerability can be fixed by changing the "*" repetition to a "?"
repetition in Gem::Version::ANCHORED_VERSION_PATTERN in
lib/rubygems/version.rb.  For RubyGems 2.1.x:

    -  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})*\s*\z/ # :nodoc:
    +  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})?\s*\z/ # :nodoc:

For RubyGems 2.0.x:

    -  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})*\s*\z/ # :nodoc:
    +  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})?\s*\z/ # :nodoc:

For RubyGems 1.8.x:

    -  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})*\s*\z/ # :nodoc:
    +  ANCHORED_VERSION_PATTERN = /\A\s*(#{VERSION_PATTERN})?\s*\z/ # :nodoc:


This vulnerability was discovered by Alexander Cherepanov <cherepan@mccme.ru>

## CVE-2015-3900: Request hijacking vulnerability in RubyGems 2.4.6 and earlier

RubyGems provides the ability of a domain to direct clients to a separate
host that is used to fetch gems and make API calls against. This mechanism
is implemented via DNS, specifically a SRV record _rubygems._tcp under the
original requested domain.

For example, this is the one that users who use rubygems.org see:

    > dig _rubygems._tcp.rubygems.org SRV

    ;; ANSWER SECTION:
    _rubygems._tcp.rubygems.org. 600 IN	SRV	0 1 80 api.rubygems.org.

RubyGems did not validate the hostname returned in the SRV record before
sending requests to it.

This left clients open to a DNS hijack attack, whereby an attacker could
return a SRV of their choosing and get the client to use it. For example:

    > dig _rubygems._tcp.rubygems.org SRV

    ;; ANSWER SECTION:
    _rubygems._tcp.rubygems.org. 600 IN	SRV	0 1 80 gems.nottobetrusted.wtf

The fix, detailed at https://github.com/rubygems/rubygems/commit/6bbee35,
shows that we validate the record now to be under the original domain. This
restricts the client to be using the original trust/security domain as they
would have otherwise.

RubyGems versions between 2.0 and 2.4.6 are vulnerable.

RubyGems version 2.0.16, 2.2.4, and 2.4.7 have been released that fix this
issue.

Ruby versions 1.9.0 through 2.2.0 are vulnerable as they contain embedded
versions of RubyGems.

This vulnerability was reported by Jonathan Claudius <JClaudius@trustwave.com>.



