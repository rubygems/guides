---
layout: default
title: Default Gems and Bundled Gems
url: /default-gems-and-bundled-gems
previous: /using-s3-source
next: /resources
---

<em class="t-gray">Understanding Ruby's standard library gems.</em>

* [What are Default Gems and Bundled Gems?](#what-are-default-gems-and-bundled-gems)
* [Default Gems](#default-gems)
* [Bundled Gems](#bundled-gems)
* [Differences Between Default and Bundled Gems](#differences-between-default-and-bundled-gems)
* [Finding Version Information](#finding-version-information)

What are Default Gems and Bundled Gems?
----------------------------------------

Large portions of Ruby's standard library come in the form of RubyGems, which can be updated independently from Ruby itself. These gems are divided into two categories: default gems and bundled gems.

Default Gems
-----------

Default gems are gems that are part of Ruby and you can always require them directly. They have the following characteristics:

* **Shipped with Ruby**: They are included in every Ruby installation
* **Cannot be uninstalled**: They are part of the core Ruby distribution
* **Can be updated**: You can update them using `gem update <gem_name>`
* **Always available**: You can require them without adding them to your Gemfile
* **Flexible versioning**: You can specify any version in your Gemfile (e.g., `gem "json", ">= 2.6"`)
* **Maintained by Ruby core**: These gems are maintained as part of the Ruby project

For a complete list of default gems in your Ruby version, you can visit [stdgems.org](https://stdgems.org/) or check the [official Ruby documentation](https://docs.ruby-lang.org/en/master/standard_library_md.html).

Bundled Gems
------------

Bundled gems are similar to normal gems, but they are automatically installed when you install Ruby. They have the following characteristics:

* **Shipped with Ruby**: They are included in Ruby installations
* **Can be uninstalled**: Unlike default gems, you can remove them if needed
* **Can be updated**: Like default gems, you can update them independently
* **Require Gemfile declaration**: When using Bundler, you need to declare them in your Gemfile
* **Maintained outside Ruby core**: These gems are maintained separately from Ruby itself

For a complete list of bundled gems in your Ruby version, visit [stdgems.org](https://stdgems.org/).

Differences Between Default and Bundled Gems
--------------------------------------------

| Feature | Default Gems | Bundled Gems |
|---------|-------------|--------------|
| Shipped with Ruby | Yes | Yes |
| Can be uninstalled | No | Yes |
| Can be updated | Yes | Yes |
| Require in Gemfile (with Bundler) | Optional | Required |
| Version flexibility in Gemfile | Any version | Any version |
| Maintenance | Ruby core team | External maintainers |
| Always available without Gemfile | Yes | No (when using Bundler) |

Finding Version Information
---------------------------

To find out which default gems and bundled gems are included in your Ruby version:

### Using the Command Line

Check your Ruby version:

    $ ruby -v
    ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-darwin23]

List installed gems:

    $ gem info json

### Using stdgems.org

Visit [https://stdgems.org/](https://stdgems.org/) to see:

* Complete lists of default and bundled gems for each Ruby version
* Version numbers for each gem in each Ruby release
* Links to gem documentation and source code
* Comparison views between Ruby versions
* JSON data files for programmatic access

### Using Ruby Documentation

The [official Ruby documentation](https://docs.ruby-lang.org/en/master/standard_library_md.html) provides information about:

* Default gems with links to their documentation and GitHub repositories
* Bundled gems with links to their documentation and GitHub repositories
* Default libraries (non-gem standard libraries)

### Compatibility Across Ruby Versions

Keep in mind that different Ruby versions ship with different versions of default and bundled gems. When developing applications that need to work across multiple Ruby versions:

* Check [stdgems.org](https://stdgems.org/) to see which gem versions are included in each Ruby version
* Specify version constraints in your Gemfile when necessary
* Test your application against the target Ruby versions

## Additional Resources

* [stdgems.org](https://stdgems.org/) - Comprehensive information about Ruby's standard gems
* [Ruby Standard Library Documentation](https://docs.ruby-lang.org/en/master/standard_library_md.html) - Official Ruby documentation
* [What is a gem?](/what-is-a-gem) - Learn more about RubyGems basics
* [RubyGems Basics](/rubygems-basics) - Getting started with RubyGems
