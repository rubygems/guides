---
layout: default
title: How Gemfile.lock works
url: /gemfile-lock
previous: /dependency-resolution
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">How to read the file that pins every gem version your application installs.</em>

`Gemfile.lock` is the output of [dependency resolution](/dependency-resolution). The first `bundle install` resolves your Gemfile and writes the exact version of every gem, direct or transitive, into the lockfile. Every later install reuses those versions instead of resolving again, so every machine, every teammate, and every deploy runs the same code. Bundler maintains the file. You never edit it by hand.

A lockfile, section by section
------------------------------

The examples below come from the lockfile that `bundle install` with Bundler 4.0 generates for this Gemfile:

    source "https://rubygems.org"

    ruby "3.4.10"

    gem "rspec"
    gem "rack-test", git: "https://github.com/rack/rack-test"
    gem "billing", path: "vendor/billing"

### GEM

Each source the Gemfile uses gets its own block, and `GEM` is the block for a gem server. It names the server under `remote:` and lists under `specs:` every gem resolved from it, at the exact version chosen:

    GEM
      remote: https://rubygems.org/
      specs:
        diff-lcs (1.6.2)
        rack (3.2.6)
        rspec (3.13.2)
          rspec-core (~> 3.13.0)
          rspec-expectations (~> 3.13.0)
          rspec-mocks (~> 3.13.0)
        rspec-core (3.13.6)
          rspec-support (~> 3.13.0)
        rspec-expectations (3.13.5)
          diff-lcs (>= 1.2.0, < 2.0)
          rspec-support (~> 3.13.0)
        rspec-mocks (3.13.8)
          diff-lcs (>= 1.2.0, < 2.0)
          rspec-support (~> 3.13.0)
        rspec-support (3.13.7)

The lines indented under a gem are its own dependencies with the constraints from its gemspec. They explain why versions were chosen, but they are requirements, not choices. The choice for `rspec-core` is its top-level entry, `rspec-core (3.13.6)`. Note that the Gemfile above asked for one gem from this server and six appear here. Transitive dependencies are locked just as precisely as direct ones.

### GIT and PATH

Gems taken from a git repository or a local directory get their own source blocks, which appear before `GEM` in the file:

    GIT
      remote: https://github.com/rack/rack-test
      revision: 1fc57f3d26275c51ba6ecea860182b94c9c242fa
      specs:
        rack-test (2.2.0)
          rack (>= 1.3)

    PATH
      remote: vendor/billing
      specs:
        billing (0.1.0)

For a git source the pinned commit under `revision:` plays the role that the version number plays in `GEM`. Later installs fetch exactly that commit, even if the branch has moved on. A path source records only the location. Its contents are read from that directory on every install, which is what makes `path:` useful while developing a gem alongside the application.

### PLATFORMS

    PLATFORMS
      arm64-darwin-27
      ruby

This lists the platforms the resolution covers. `ruby` is the generic platform of pure-Ruby gems, and the others are concrete platforms the lockfile was resolved for, which matters for gems that ship precompiled platform-specific versions. If you develop on macOS and deploy to Linux, add the deploy platform so resolution covers it too:

    bundle lock --add-platform x86_64-linux

On macOS the concrete platform records the Darwin major version, `arm64-darwin-27` above. That number differs between macOS releases, so lockfiles generated on different Macs disagree about the platform for no useful reason. Normalizing the list is strongly recommended:

    bundle lock --normalize-platforms

This rewrites the entry to the versionless `arm64-darwin`, which covers every macOS release, and later installs keep the normalized form.

### DEPENDENCIES

    DEPENDENCIES
      billing!
      rack-test!
      rspec

These are the direct dependencies, one line per `gem` call in the Gemfile. Anything in the source blocks that is missing here is a transitive dependency. A trailing `!` marks a gem pinned to a non-default source, one of the `GIT` or `PATH` blocks above.

### CHECKSUMS

    CHECKSUMS
      billing (0.1.0)
      bundler (4.0.16) sha256=d6ca5dd440c24f9abce9844cf44cc8e18c6a553de65a47efb4544137af92c47d
      diff-lcs (1.6.2) sha256=9ae0d2cba7d4df3075fe8cd8602a8604993efc0dfa934cff568969efb1909962
      rack (3.2.6) sha256=5ed78e1f73b2e25679bec7d45ee2d4483cc4146eb1be0264fc4d94cb5ef212c2
      rack-test (2.2.0)
      rspec (3.13.2) sha256=206284a08ad798e61f86d7ca3e376718d52c0bc944626b2349266f239f820587
      ...

Each checksum is the SHA-256 digest of the packaged `.gem` file, and Bundler verifies every gem against it during installation. A gem that was tampered with after the lockfile was written fails to install, which protects deploys against a compromised gem source. Gems from git and path sources have no packaged file to digest, so their entries carry no checksum. Bundler writes this section into new lockfiles by default. To add it to an existing lockfile, see [Lockfile checksums](/security#lockfile-checksums).

### RUBY VERSION

    RUBY VERSION
      ruby 3.4.10

This section appears only when the Gemfile declares a `ruby` version, and records the Ruby the project was locked with. Without the declaration the lockfile has no opinion about the Ruby version.

### BUNDLED WITH

    BUNDLED WITH
      4.0.16

The Bundler version that wrote the lockfile. When another machine runs `bundle` commands in this project, Bundler automatically switches to this version if it is installed, so the whole team locks with the same Bundler. See [Which Bundler version runs](/installation#which-bundler-version-runs).

When to commit it
-----------------

For an application, always commit `Gemfile.lock`. The lockfile is how a deploy or a teammate reproduces your exact gem versions, and an uncommitted lockfile silently turns every install back into a fresh resolution. For a gem, the lockfile is not part of the package. When an application depends on your gem, Bundler resolves your gemspec's dependencies together with everything else and ignores any lockfile your gem ships, as covered in [Gemfile and gemspec](/gemfile-and-gemspec). Whether to commit the lockfile of the gem's own repository for development is a separate tradeoff, discussed in the [FAQs](/faqs#using-gemfiles-inside-gems).

Because Bundler regenerates the file, never resolve a merge conflict in `Gemfile.lock` by hand. Bundler refuses to load a lockfile containing conflict markers and asks for a clean copy. Restore one side with `git checkout HEAD -- Gemfile.lock`, merge the Gemfile normally, then run `bundle install` and Bundler re-locks whatever the merged Gemfile changed while keeping unrelated pins in place.
