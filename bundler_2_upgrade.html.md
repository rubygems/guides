---
title: How to Upgrade to Bundler 2
---

# How to Upgrade to Bundler 2

So! You’ve heard that [Bundler 2 was released](https://bundler.io/blog/2019/01/03/announcing-bundler-2.html)! If you want to try out Bundler 2 for yourself, this guide will help you do that.

Bundler 2 is almost entirely the same as the previous version, 1.17. The big change is that Bundler now requires at least Ruby 2.3.0 and RubyGems 2.5.0.

### Prerequisites
Before you upgrade to Bundler 2, make sure you have the right Ruby and RubyGems. You need to be using Ruby 2.3.0 or higher, and you need to have RubyGems 2.5.0 or higher.

You can check your Ruby version by running `ruby --version`, and you can check your RubyGems version by running `gem --version`. If you need to upgrade Ruby, use your ruby version manager’s instructions. If you need to upgrade RubyGems, run `gem update --system`.

All set? Ruby and RubyGems versions new enough? Great. Keep going.

### Installing Bundler 2
The first step in upgrading to Bundler 2 is installing the Bundler 2 gem. To install it the usual way, run `gem install bundler` and RubyGems will install the latest version of Bundler.

### Version Autoswitch
Now that you have Bundler 2 installed, you should know that Bundler will automatically switch between version 1 and version 2 based on your application’s `Gemfile.lock`. If your lockfile was created by Bundler 1, your commands will be run by Bundler 1. If your lockfile was created by Bundler 2, your commands will be run by Bundler 2.

Here's an example Gemfile.lock that was created with Bundler 1.17.1.

    GEM
      remote: https://rubygems.org/
      specs:
        rack (2.2.4)

    PLATFORMS
      ruby

    DEPENDENCIES
      rack

    BUNDLED WITH
       1.17.1

The version of Bundler in the `BUNDLED WITH` section is read by Bundler to determine which version of Bundler should run. Using the example lock above, Bundler 1 will be used, as you can see here:

    $ grep -A 1 "BUNDLED WITH" Gemfile.lock
    BUNDLED WITH
       1.17.1

    $ bundle version
    Bundler version 1.17.1

When a Gemfile has been created by Bundler 2, or manually upgraded by a developer from Bundler 1 to Bundler 2, then commands will be run by the latest installed Bundler 2. Here’s an example of what that looks like:

    $ grep -A 1 "BUNDLED WITH" Gemfile.lock
    BUNDLED WITH
       2.0.0

    $ bundle version
    Bundler version 2.0.0

When Bundler is used outside of an application, the latest version that is installed will always be used.

    $ ls -a
    .	..

    $ bundle version
    Bundler version 2.0.0

### Upgrading applications from Bundler 1 to Bundler 2
Your existing applications will continue to use Bundler 1. Bundler will never change your application to a new major version until you choose to do so. If your application is ready, you can upgrade that application to the latest installed version of Bundler by running `bundle update --bundler`.

We recommend committing your Gemfile.lock before you upgrade. That way, if something goes wrong or doesn’t work, you can always revert to the previous lockfile and go back to using Bundler 1.

### Using Bundler 2 with new applications
When you create a new application, using `bundle init`, `rails new`, or something like that, your application will use the newest version of Bundler that is currently installed. If you have Bundler 2 installed, your application will be locked to Bundler 2. You can verify this by reading the lockfile, looking for the section named `BUNDLED WITH`.

## FAQ

### Why does Bundler have automatic version switching?
Many Ruby developers have more than one application on their machines. If we forced all applications on one machine to use either Bundler 1 or Bundler 2 exclusively, it would cause everyone a huge amount of pain.

Version switching allows everyone to have some applications use Bundler 1 while other applications can use Bundler 2, on the same machine, at the same time. Each application can be upgraded to Bundler 2 whenever it makes the most sense for that particular application to upgrade.

### What happens if my application needs Bundler 2, but I only have Bundler 1 installed?
If you try to use Bundler 1 on an application that requires Bundler 2, you’ll see an error message explaining that you need to install Bundler 2. Go ahead and run `gem install bundler`, and then it should work.

### What happens if my application needs Bundler 1, but I only have Bundler 2 installed?
If you try to use Bundler 2 on an application that needs Bundler 1, and you also don’t have Bundler 1 installed at all, you’ll see an error message asking you to install Bundler 1. Go ahead and run `gem install bundler -v "~>1.0"` to install the latest 1.x version of Bundler, and then try your command again.

### Can I downgrade my application from Bundler 2 to Bundler 1?
Bundler 2 does not provide a way to downgrade a Gemfile back to Bundler 1. Instead, we recommend checking in your `Gemfile` and `Gemfile.lock` before you upgrade your application. That way, if something goes wrong, you can revert to the previous commit and go back to using Bundler 1.

### There was an issue upgrading my application to Bundler 2
Oh no! Sorry about that. Please head over to our [troubleshooting guide](https://github.com/rubygems/rubygems/blob/master/bundler/doc/TROUBLESHOOTING.md#other-problems) and open a ticket so that we can try to fix your problem ASAP.

### Will Bundler 2 have any other notable changes?
Bundler 2 includes these changes:

* Remove support for deprecated versions of Ruby (\< 2.3)
* Remove support for deprecated versions of RubyGems (\< 2.5.0)
* Print Bundler errors to STDERR instead of STDOUT
* The `github:` shortcut in the `Gemfile` will use `https` instead of `http`

### Can I use Bundler 2 on Heroku?
Yes you can! The Heroku team has upgraded the official Ruby buildpack to [support Bundler 2](https://devcenter.heroku.com/articles/ruby-support#libraries). See [Heroku's article on Bundler version](https://devcenter.heroku.com/articles/bundler-version) for more details.
