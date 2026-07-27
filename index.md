---
layout: default
title: Guides
previous: /credits
next: /rubygems-basics
---

<em class="text-neutral-600">Everything about library management in Ruby: learn what gems are, how to use them in your projects, and how to build and publish your own.</em>

Ruby libraries are packaged and distributed as **gems**. Two tools that ship with Ruby manage them: **RubyGems** installs individual gems and provides the `gem` command, and **Bundler** tracks the exact set of gems an application depends on through a `Gemfile`. [RubyGems.org](https://rubygems.org) is the community hosting service where gems are published and downloaded.

```sh
# Install a gem and use it right away
gem install nokogiri

# Track dependencies for a project
bundle init
bundle add rack
```

<div class="not-prose grid gap-5 sm:grid-cols-2 my-10">
  <div class="rounded-xl border border-neutral-300 bg-white p-6">
    <h2 class="text-xl font-bold text-neutral-800 mb-1">Getting Started</h2>
    <p class="text-neutral-600 mb-4">New to gems? Follow the tutorial from installing your first gem to publishing your own.</p>
    <ul class="space-y-1.5">
      <li><a class="text-orange-700 hover:underline" href="/rubygems-basics">RubyGems Basics</a></li>
      <li><a class="text-orange-700 hover:underline" href="/getting_started">Getting Started with Bundler</a></li>
      <li><a class="text-orange-700 hover:underline" href="/make-your-own-gem">Make your own gem</a></li>
      <li><a class="text-orange-700 hover:underline" href="/publishing">Publishing your gem</a></li>
    </ul>
  </div>
  <div class="rounded-xl border border-neutral-300 bg-white p-6">
    <h2 class="text-xl font-bold text-neutral-800 mb-1">Guides</h2>
    <p class="text-neutral-600 mb-4">Task-oriented how-tos for everyday work with gems.</p>
    <ul class="space-y-1.5">
      <li><a class="text-orange-700 hover:underline" href="/updating_gems">Update gems with Bundler</a></li>
      <li><a class="text-orange-700 hover:underline" href="/trusted-publishing">Set up Trusted Publishing</a></li>
      <li><a class="text-orange-700 hover:underline" href="/setting-up-multifactor-authentication">Secure your account with MFA</a></li>
      <li><a class="text-orange-700 hover:underline" href="/deploying">Deploy a bundled application</a></li>
    </ul>
  </div>
  <div class="rounded-xl border border-neutral-300 bg-white p-6">
    <h2 class="text-xl font-bold text-neutral-800 mb-1">Concepts</h2>
    <p class="text-neutral-600 mb-4">How library management in Ruby works under the hood.</p>
    <ul class="space-y-1.5">
      <li><a class="text-orange-700 hover:underline" href="/what-is-a-gem">What is a gem?</a></li>
      <li><a class="text-orange-700 hover:underline" href="/default-gems-and-bundled-gems">Default gems and bundled gems</a></li>
      <li><a class="text-orange-700 hover:underline" href="/cve">Common Vulnerabilities and Exposures</a></li>
    </ul>
  </div>
  <div class="rounded-xl border border-neutral-300 bg-white p-6">
    <h2 class="text-xl font-bold text-neutral-800 mb-1">Reference</h2>
    <p class="text-neutral-600 mb-4">Commands, file formats, and APIs in full detail.</p>
    <ul class="space-y-1.5">
      <li><a class="text-orange-700 hover:underline" href="/command-reference">gem Command Reference</a></li>
      <li><a class="text-orange-700 hover:underline" href="/command-reference/bundle">Bundler Command Reference</a></li>
      <li><a class="text-orange-700 hover:underline" href="/gemfile">Gemfile Reference</a></li>
      <li><a class="text-orange-700 hover:underline" href="/specification-reference">Specification Reference</a></li>
      <li><a class="text-orange-700 hover:underline" href="/rubygems-org-api">RubyGems.org API</a></li>
    </ul>
  </div>
</div>
