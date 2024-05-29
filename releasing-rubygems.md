---
layout: default
title: Releasing Rubygems
url: /releasing-rubygems
previous: /cve
next: /trusted-publishing
---

<em class="t-gray">A runbook for making RubyGems releases.</em>

RubyGems has a more complicated release process than most gems do.
RubyGems updates are shipped in a [wrapper gem](https://rubygems.org/gems/rubygems-update)
that the `gem update --system` command downloads, and then
runs [`setup.rb`](https://github.com/rubygems/rubygems/blob/master/setup.rb).

RubyGems adheres to [semantic versioning](https://semver.org/) in its version numbering.

_Note: In the documentation listed below, the *current* minor version number is
2.7 and the *next* minor version number is 2.8_

Regardless of the version, *all releases* must update the `History.txt` and `lib/rubygems.rb`
files. The changelog for the first stable minor release (`2.7.0`) is a sum of all
the preceding pre-release versions (`2.7.pre.1`, `1.12.pre.2`, etc) for that
minor version. The changelog for the first stable minor release is left blank
unless there are fixes included since the last pre/rc release.

## Workflow

In general, `master` will accept PRs for:

* feature merges for the next minor version (2.8)
* regression fix merges for a patch release on the current minor version (2.7)

### Breaking releases

RubyGems cares a lot about preserving compatibility. As a result, changes that
break backwards compatibility should (whenever this is possible) include a feature
release that is backwards compatible, and issue warnings for all options and
behaviors that will change.

We try very hard to only release breaking changes when incrementing the _major_
version of RubyGems.

### Cherry picking

Patch releases are made by cherry-picking bug fixes from `master`.

When we cherry-pick, we cherry-pick the merge commits using the following command:

```bash
$ git cherry-pick -m 1 MERGE_COMMIT_SHAS
```

The `./util/patch_with_prs.rb` utility will automatically handle
cherry-picking, and is further detailed below.

## History

RubyGems maintains a list of changes present in each version in the `History.txt` file.
Entries are added immediately before making a release by using the
`./util/update_changelog.rb` utility.
Generally, each PR that's included in the release will get an entry.

## Releases

### Minor releases

While pushing a gem version to RubyGems.org is as simple as `rake release`,
releasing a new version of RubyGems includes a lot of communication: team consensus,
git branching, changelog writing, documentation site updates, and a blog post.

Dizzy yet? Us too.

Here's the checklist for releasing new minor versions:

* [ ] Check with the core team to ensure that there is consensus around shipping a
  feature release. As a general rule, this should always be okay, since features
  should _never break backwards compatibility_
* [ ] Create a new stable branch from master (see **Branching** below)
* [ ] Update the `VERSION` constant in `lib/rubygems.rb` to the new version number
* [ ] Update `History.txt` to include all of the changes in the release
* [ ] Run `rake release`, tweet, blog, let people know about the prerelease!

At this point, you're a release manager! Pour yourself several tasty drinks and
think about taking a vacation in the tropics.

Beware, the first couple of days after the first version in a minor version
series can often yield a lot of bug reports. This is normal, and doesn't mean you've done
_anything_ wrong as the release manager.

#### Branching

Minor releases of the next version start with a new release branch from the
current state of master: `2.7`.

Once that stable branch has been cut from `master`, changes for that minor
release series (2.7) will only be made _intentionally_, via patch releases.
That is to say, changes to `master` by default _won't_ make their way into any
`2.7` version, and development on `master` will be targeting the next minor
or major release.

### Patch releases (bug fixes!)

Releasing new bugfix versions is really straightforward. Increment the tiny version
number in `lib/rubygems.rb`, and in `History.txt` add one bullet point
per bug fixed. Then run `rake release` from the `2.7` (stable) branch,
and pour yourself a tasty drink!

PRs containing regression fixes for a patch release of the current minor version
are merged to master. These commits are then cherry-picked from master onto the
minor branch (`2.7`).

There is a `./util/patch_with_prs.rb` utility that automates creating a patch release.
It takes a single option, the _exact_ patch release being made (e.g. `--version=2.7.8`),
and all other arguments are the PR numbers to be included in the patch release.
The utility checks out the appropriate stable branch (`2.7`), and then cherry-picks those changes
(and only those changes) to the stable branch. The task then bumps the version in the
version file, prompts you to update the `History.txt`, then will commit those changes
and run `rake release`!
