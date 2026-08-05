---
layout: default
title: How dependency resolution works
url: /dependency-resolution
previous: /gem-installation-and-loading
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">How Bundler picks one set of gem versions that satisfies your Gemfile and every gemspec at once.</em>

Before installing anything, `bundle install` has to decide which version of every gem to use. That decision is dependency resolution. Knowing what the resolver is trying to do makes version constraints, `Gemfile.lock`, and conflict errors much easier to reason about.

The resolution problem
----------------------

Your Gemfile declares the gems your application uses directly. Each of those gems declares its own dependencies in its gemspec, those dependencies declare more, and so on. See [Gemfile and gemspec](/gemfile-and-gemspec) for how the two files relate. The result is a graph in which the same gem often appears several times with different version requirements. Resolving means choosing exactly one version of every gem in the graph so that all requirements hold at the same time.

Simply taking the newest version of everything does not work. Suppose your Gemfile lists `payments` and `reporting`, the newest `payments` release requires `money >= 7.0`, and every version of `reporting` requires `money ~> 6.1`. No single `money` satisfies both, so newest-of-everything fails. A valid answer still exists. The resolver can pick an older `payments` release that accepts `money 6.x`. Choosing a version for one gem narrows the choices for its dependencies, and those choices narrow the next gem's, so resolution is a search across combinations rather than a per-gem lookup.

`gem install` performs the same kind of resolution for a single gem and its dependencies. Bundler resolves the whole application at once and records the answer in `Gemfile.lock`. Without that record, two machines installing the same list of gems at different times can resolve to different versions, which is the problem Bundler was created to solve.

What version constraints mean
-----------------------------

A requirement is one or more comparisons against a version:

    gem "rack", ">= 2.2"            # 2.2.0 or later
    gem "rack", ">= 2.2", "< 4.0"   # within a range
    gem "rack", "= 3.2.6"           # exactly this version

The pessimistic operator `~>` allows the last given digit to grow but not the ones before it. `~> 3.2` means `>= 3.2` and `< 4.0`. `~> 3.2.6` means `>= 3.2.6` and `< 3.3.0`. The extra digit matters. `~> 2.2` allows 2.9.9, while `~> 2.2.0` stops within the 2.2.x series and rejects 2.3.0. Pick the level of change you are prepared to absorb automatically.

Prerelease versions contain a letter, like `8.1.0.beta1`, and sort before the release they lead up to. The resolver never considers them unless a requirement explicitly names one, so `gem "rails", ">= 8.1.0.beta1"` opts in and plain `gem "rails"` does not.

How the resolver works
----------------------

Both Bundler and `gem install` resolve with PubGrub, a version solving algorithm originally developed for Dart's package manager and since adopted across ecosystems. PubGrub explores candidate versions, learns from each dead end which combinations can never work, and uses that knowledge to skip whole regions of the search space. This keeps resolution fast even for large graphs, and when no solution exists it can explain why rather than just giving up.

That explanation is what a conflict error shows. Bundler walks through the conflicting requirement chains, each step naming which gem demanded which versions of which dependency. How to read those chains and work out of a conflict is covered in [Troubleshooting common issues](/troubleshooting#dependency-resolution-conflicts).

Resolution and the lockfile
---------------------------

Resolution does not happen on every install. The first `bundle install` resolves and writes the chosen versions to `Gemfile.lock`. From then on `bundle install` reuses the locked versions exactly, which is why it is fast and gives every machine and deploy the same gems. If you edit the Gemfile, the next `bundle install` re-resolves only as much as the change requires and leaves the rest of the lockfile untouched.

Re-resolving on purpose is what `bundle update` is for:

    bundle update                     # everything, to the newest allowed versions
    bundle update rack                # one gem, allowing its dependencies to move
    bundle update rack --conservative # one gem, keeping its dependencies locked

Cooldown
--------

A [cooldown](/cooldown) excludes gem versions published less than a chosen number of days ago from resolution. This narrows the candidate set, so the resolver may pick an older version than it otherwise would, and a resolution can even fail although a compatible version exists, because that version is still inside the window. Error messages note when candidates were excluded by the cooldown, and versions already in your lockfile are never retracted by it.
