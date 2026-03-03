---
title: How to troubleshoot RubyGems and Bundler TLS/SSL Issues
---

# How to troubleshoot RubyGems and Bundler TLS/SSL Issues

If you’ve experienced issues related to SSL certificates and/or TLS versions, you’ve come
to the right place. In this guide, we’ll explain how both of those issues come about and how
to solve them. Many of the instructions in this guide can help fix either the SSL certs issue
or the TLS version issue.

If you're not interested in the reasons, and just want to get things fixed as quickly as
possible, you can jump straight to [solutions for SSL issues][solutions-for-ssl-issues].

## Table of Contents

  - **The Problems**
    - [Why am I seeing `certificate verify failed`?][verify-failed]
      - [What are these certificates?][what-are-certificates]
      - [How Ruby uses CA certificates][how-ruby-uses-ca-certs]
      - [Troubleshooting certificate errors][troubleshooting-certificate-errors]
    - [Why am I seeing `read server hello A`?][read-server]
      - [SSL and TLS protocol versions][ssl-and-tls-protocol-versions]
      - [TLS 1.0 and 1.1 are deprecated][tls-10-and-11-are-deprecated]
      - [Troubleshooting protocol errors][troubleshooting-protocol-errors]
  - **The Solutions**
    - [Automated SSL check][ssl-check]
    - [Updating Bundler][update-bundler]
    - [Updating RubyGems][update-rubygems]
    - [Updating System Clock][update-system-clock]
    - [Updating CA certificates][updating-ca-certificates]
      - [Installing new RubyGems certificates][update-rubygems-certs]
      - [Installing new OS certificates][update-os-certs]
    - [Reinstalling Ruby from version managers][installing-from-version-managers]
      - [Installed with `rvm`][installed-with-rvm]
      - [Installed with `ruby-build` or `rbenv install`][installed-with-ruby-build]
    - [Reinstalling Ruby from OS package managers][installing-from-package-managers]
      - [macOS: Built-in Ruby][macos-built-in-ruby]
      - [macOS: Installed with Homebrew][installed-with-homebrew]
      - [Debian or Ubuntu 16.04: Installed with `apt-get`][installed-with-apt-get]
      - [Fedora: Installed with `dnf`][installed-with-dnf]
      - [RHEL or CentOS: Installed with `yum`][installed-with-yum]
      - [Windows: Installed with Ruby Installer][windows-ruby-installer]
  - **Additional Help**
    - [Another automated SSL check][another-automated-ssl-check]
    - [Creating an issue][creating-an-issue]

## The Problems

### Why am I seeing `certificate verify failed`?
[verify-failed]: #why-am-i-seeing--code-certificate-verify-failed--code--

If you've seen the following SSL error when trying to pull updates from RubyGems:
`OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed`

This error happens when your computer is missing a file that it needs to verify that the server
behind RubyGems.org is the correct one.

The latest version of RubyGems should fix this problem, so we recommend updating to the current
version. To tell RubyGems to update itself to the latest version, run `gem update --system`. If
that doesn’t work, try the manual update process below.

(What do we mean by updating “should fix this problem”? Review the [What are these certificates?][what-are-certificates]
and [How Ruby uses CA certificates][how-ruby-uses-ca-certs] sections
below to gain a better understanding of the underlying problems.)

#### What are these certificates?
[what-are-certificates]: #what-are-these-certificates

Anytime your computer is talking to a server using HTTPS, it uses an _SSL certificate_ as part
of that connection. The certificate allows your computer to know that it is talking to the real
server for a domain, and allows it to make sure that your computer and that server can
communicate completely privately, without any other computer knowing what is sent back and forth.

To know if the certificate for RubyGems.org is correct, your computer consults another
certificate from a Certificate Authority (CA). The CA certificate bundle includes certificates
from every company that provides SSL certificates for servers, like Verisign, Globalsign, and
many others.

Each CA has a "root” certificate that they use to verify other certificates. The CA certificates
are called "root" because they sign other certificates that sign yet other certificates, and a
graph of the certificates would look like a tree, with the "root" certificates at the root of
the tree. Your computer will use its built-in CA bundle of many root certificates to know
whether to trust an SSL certificate provided by a particular website, such as RubyGems.org.

Occasionally, new companies are added to the CA bundle, or existing companies have their certificates
expire and need to distribute new ones. For most websites, this isn't a huge
problem, because web browsers regularly update their CA bundle as part of general browser
updates.

#### How Ruby uses CA certificates
[how-ruby-uses-ca-certs]: #how-ruby-uses-ca-certificates

The SSL certificate used by RubyGems.org descends from a new-ish root certificate. Ruby (and
therefore RubyGems and Bundler) does not have a regularly updated CA bundle to use when
contacting websites. Usually, Ruby uses a CA bundle provided by the operating system (OS). On
older OSes, this CA bundle can be really old—as in a decade old. Since a CA bundle that old
can’t verify the (new-ish) certificate for RubyGems.org, you might see the error in question:
`certificate verify failed`.

Further complicating things, an otherwise unrelated change 18-24 months ago lead to a new SSL
certificate being issued for RubyGems.org. This meant the “root” certificate that needed to
verify connections changed. So even if you’d previously upgraded RubyGems/Bundler in order to
fix the SSL problem, you would need to upgrade again—this time to an even newer version with
even newer certificates.

#### Troubleshooting certificate errors
[troubleshooting-certificate-errors]: #troubleshooting-certificate-errors

Start by [running the automatic SSL check][ssl-check], and follow the instructions. You might need
to [update Bundler][update-bundler], [update RubyGems][update-rubygems],
[manually update RubyGems certificates][update-rubygems-certs], or perhaps
even [install new OS certificates][update-os-certs].

### Why am I seeing `read server hello A`?
[read-server]: #why-am-i-seeing--code-read-server-hello-a--code--

This error means that your machine was unable to establish a secure connection to RubyGems.org.
The most common cause for that problem is a Ruby that uses an old version of OpenSSL. OpenSSL
1.0.1, released March 12, 2012, is the minimum version required to connect to
RubyGems.org, starting January 1, 2018.

To understand why that version is required, keep reading. To see instructions on how to update
OpenSSL and/or Ruby to fix the problem, skip to the
[troubleshooting section][troubleshooting-protocol-errors].

#### SSL and TLS protocol versions
[ssl-and-tls-protocol-versions]: #ssl-and-tls-protocol-versions

Secure connections on the internet use [HTTPS](https://en.wikipedia.org/wiki/HTTPS),
the secure version of HTTP. That security was originally provided by SSL, an acronym
for Secure Sockets Layer. Over time, researchers discovered flaws in SSL, and network
developers responded with changes and fixes. After SSL 3.0, it was replaced by TLS, or
[Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security).

Over time, TLS was also revised. TLS version 1.2, originally defined in 2011, and supported
by OpenSSL starting in 2012, is the current standard. In 2017, every version of SSL and TLS
older than TLS 1.2 has been found to have critical flaws that can be exploited by a
determined or knowledable adversary. As a result, security best practices suggest actively
blocking all versions of SSL, as well as TLS versions 1.0 and 1.1.

#### TLS 1.0 and 1.1 are deprecated
[tls-10-and-11-are-deprecated]: #tls-10-and-11-are-deprecated

RubyGems.org uses a 3rd party CDN provider called [Fastly](https://www.fastly.com/), which lets
users all around the world download gems really quickly.

Last year, Fastly announced it will deprecate TLS versions 1.0 and 1.1 due to a mandate
published by the PCI Security Standard Council.
([Read more about this in Fastly’s blog post.](https://www.fastly.com/blog/update-our-tls-10-and-11-deprecation-plan))

As a result, RubyGems.org will require TLSv1.2 at minimum starting January 2018. This means
RubyGems.org and the `gem` command will no longer support versions of Ruby and OpenSSL that are
do not have support of TLS 1.2.

#### Troubleshooting protocol errors
[troubleshooting-protocol-errors]: #troubleshooting-protocol-errors

To troubleshoot protocol connection errors, start by [running the automatic SSL check][ssl-check],
and follow the instructions. You might need to [update Bundler][update-bundler],
[update RubyGems][update-rubygems], or even reinstall Ruby (you can find reinstallation
instructions by [version manager][installing-from-version-managers]
or [package manager][installing-from-package-managers].)

## The Solutions
[solutions-for-SSL-issues]: #solutions-for-ssl-issues

### Automated SSL check
[ssl-check]: #automated-ssl-check

First, [run this script](https://github.com/rubygems/ruby-ssl-check/blob/master/check.rb) to
check whether your errors result from the SSL certs issue or the TLS versions issue.

You can run the script immediately with this command (Windows 10 also):

```$ curl -Lks 'https://git.io/rg-ssl' | ruby```

If the output reads “Your Ruby can't connect to rubygems.org because you are missing the
certificate” you have a certificate verification error, and need to update your certs.

If you instead see "Your Ruby can't connect to rubygems.org because your version of OpenSSL is
too old” your OpenSSL version is old and incompatible with TLSv1.2, and you need to upgrade your
OpenSSL and/or recompile Ruby to use a newer version of SSL.

The instructions in this guide can help you troubleshoot both problems.


### Updating Bundler
[update-bundler]: #updating-bundler

Update to the latest version of Bundler by running:

```gem install bundler```

### Updating RubyGems
[update-rubygems]: #updating-rubygems

You might be able to upgrade RubyGems using the self-update command:

```gem update --system```

If that command fails, you can try downloading the latest RubyGems yourself and installing it, using these steps. In this example, we will be downloading and installing RubyGems 2.7.6. If the latest version of RubyGems has changed by the time you are reading this, you will need to change anyplace you see `2.7.6` to the version of RubyGems that you have downloaded.

1. Using your web browser, head to the [Download RubyGems](https://rubygems.org/pages/download) page, and download the gem version of the latest rubygems.
2. Once you've downloaded the gem, open Terminal.app on macOS, or Command Prompt with Ruby on Windows.
3. Change directories to your Downloads folder. On macOS, the command would be `cd ~/Downloads`. On Windows, it would be `cd C:\Users\%USERNAME%\Downloads`.
4. Install the downloaded RubyGems upgrade gem by running `gem install --local rubygems-update-2.7.6.gem`.
5. Run the upgrade command `update_rubygems`.

You're done! Run `gem --version` to verify that you are using the latest version of RubyGems.

### Updating System Clock
[update-system-clock]: #updating-system-clock

If your system clock is set to a time in the past or future, your machine will not be able to establish a secure connection to RubyGems.org. To resolve the issue, you will need to set your system clock to the current time. In Linux, you can update the system clock by running `sudo ntpdate ntp.ubuntu.com`. 

Here are other possible solutions for updating a system clock:

- macOS: [Set the date and time on your Mac](https://support.apple.com/guide/mac-help/set-the-date-and-time-mchlp2996/mac)
- Ubuntu: [Ubuntu Time Management](https://help.ubuntu.com/community/UbuntuTime)
- Windows: [Getting Windows 10 time to sync with a time server](https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings-winpc/how-to-force-windows-10-time-to-synch-with-a-time/20f3b546-af38-42fb-a2d0-d4df13cc8f43)
- Vagrant: [Correcting the system clock in Vagrant](https://stackoverflow.com/questions/33939834/how-to-correct-system-clock-in-vagrant-automatically)


### Updating CA certificates
[updating-ca-certificates]: #updating-ca-certificates

#### Installing new RubyGems certificates
[update-rubygems-certs]: #installing-new-rubygems-certificates

If you’re unable to update RubyGems, you can manually add the certificate RubyGems needs. If you
have a version of RubyGems new enough (version 2.1.x and above) that can use those “vendored”
certificates—and you install the certificate successfully—it will work without upgrading the
RubyGems version.

**Warning**: These instructions will only add new certs; Ruby will be left untouched. To ensure
your Ruby version can use TLSv1.2, run the snippet again. If not, follow a different set of
instructions in this guide for upgrading Ruby as well.

**Step 1: Get the new trust certificate**

Download the `.pem` file from this link: [GlobalSignRootCA.pem](https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/rubygems.org/GlobalSignRootCA_R3.pem)

Then, find the downloaded file, and check to make sure the filename ends in `.pem`.
(*Note*: Some browsers will change the extension to `.txt`, which will prevent this from working.
So it’s important to make sure the file you downloaded ends in a `.pem` extension.)

**Step 2: Locate RubyGems certificate directory in your installation**

Next, you’ll want to find the directory where you installed Ruby in order to add the .pem file there.

**On Windows**:

Open your command line and type in:

```C:\>gem which rubygems```

You’ll see output like this:

```C:/Ruby21/lib/ruby/2.1.0/rubygems.rb```

To open a window showing the directory we need to find, enter the path part up to the file
extension in the same window (but using backslashes instead). For example, based on the output
above, you would run this command:

```C:\>start C:\Ruby21\lib\ruby\2.1.0\rubygems```

This will open an Explorer window, showing the directory RubyGems is installed into.

**On macOS**:

Open Terminal and run this command:

```$ gem which rubygems```

You’ll see output like this:

```/opt/rubies/2.4.1/lib/ruby/2.4.0/rubygems.rb```

To open a window showing the directory we need to find, use the `open` command on that output
without the “.rb” on the end, like this:

```$ open /opt/rubies/2.4.1/lib/ruby/2.4.0/rubygems```

A Finder window will open showing the directory that RubyGems is installed into.

**Step 3: Copy new trust certificate**

In the window, open the `ssl_certs` directory. Find other `.pem` files like
`AddTrustExternalCARoot.pem` (may be located in subdirectories like `rubygems.org`)
and drag your file beside them.

Once you’ve done this, it should be possible to follow the directions at the very top to
automatically update RubyGems. Visit the [Update RubyGems][update-rubygems] section for
step-by-step instructions. If that doesn’t work, keep following this guide.

#### Installing new OS certificates
[update-os-certs]: #installing-new-os-certificates

This solution might work when the version of OpenSSL installed with Homebrew interferes
with Ruby’s ability to find the correct certificates. Sometimes, uninstalling everything and
starting again from scratch is enough to fix things.

First, you’ll want to remove RVM. You can do that by running this command:

```$ rvm implode```

Next, you’ll want to remove OpenSSL from Homebrew. (Using `--force` ensures that you remove all
versions of OpenSSL you might have):

```$ brew uninstall openssl --force```

Now, you can reinstall RVM, following the instructions from the previous step.


### Reinstalling Ruby from version managers
[installing-from-version-managers]: #reinstalling-ruby-from-version-managers

#### Installed with `rvm`
[installed-with-rvm]: #installed-with-rvm

**Note**: Try this solution if updating SSL certificates with RVM doesn’t work. If Ruby
installed with RVM can’t find the correct certificates even after they have been updated,
 you might be able to fix it by reinstalling RVM and then reinstalling your Ruby version.

Run these commands to remove RVM and reinstall it:

```$ rvm implode
   $ \curl -sSL https://get.rvm.io | bash -s stable
```

Then, reinstall Ruby while telling RVM that you don’t want to use precompiled binaries.
(Unfortunately, this will take longer, but it will hopefully fix the SSL problem.)

This command will install Ruby 2.2.3. Adjust the command to install the version(s) of Ruby that you need:

```$ rvm install 2.2.3 --disable-binary```

#### Installed with `ruby-build` or `rbenv install`
[installed-with-ruby-build]: #installed-with-ruby-build-or-rbenv-install

Follow the instructions outlined in the [Updating and Troubleshooting ruby-build guide](https://github.com/rbenv/ruby-build/wiki#updating-ruby-build) by rbenv.


### Reinstalling Ruby from OS package managers
[installing-from-package-managers]: #reinstalling-ruby-from-os-package-managers

#### macOS: Built-in Ruby
[macos-built-in-ruby]: #macos-built-in-ruby

macOS 10.13 High Sierra comes with default Ruby that is compatible with TLSv1.2.

To check your current macOS version, go to the Apple menu and choose “About This Mac”.
If you see anything other than “macOS High Sierra”, you will need to upgrade to the newest
macOS (or else install a newer version of Ruby with Homebrew by following the next set of
instructions after these).

To upgrade to High Sierra:

- 1. Open the App Store application
- 2. Choose the “Updates” tab
- 3. Click the “Install” button for “macOS High Sierra”

#### macOS: Installed with Homebrew
[installed-with-homebrew]: #macos-installed-with-homebrew

*Note*: To install a newer version of Ruby with Homebrew, first make sure Homebrew is installed.
If the `brew` command is not present, follow the installation instructions at [https://brew.sh](https://brew.sh)
and then come back to these steps.

- 1. Run `brew update`
- 2. Run `brew install ruby`
- 3. If Ruby is already installed, run `brew upgrade ruby` to upgrade to the latest version.

#### Debian or Ubuntu 16.04: Installed with `apt-get`
[installed-with-apt-get]: #debian-or-ubuntu-installed-with-apt-get

**Note**: To remove Ruby with `apt`, you’ll need to check which versions of Ruby you have installed.
`apt` installs Ruby v2.3.1.

To uninstall, follow the [directions listed here](https://stackoverflow.com/a/22753859).
(These instructions work for both Ubuntu and Debian.)

Once you’ve successfully uninstalled Ruby, reinstall it by running:

```$ sudo apt-get install ruby```

#### Fedora: Installed with `dnf`
[installed-with-dnf]: #fedora-installed-with-dnf

**Note**: The newest versions of Fedora use `dnf` as its package manager, but older versions
use `yum` instead. If you see the error message `dnf: command not found`, replace the `dnf`
in these instructions with `yum`.

First, uninstall Ruby by running:

```$ dnf remove ruby```

And then reinstall (this command will install Ruby 2.3):

```$ dnf install ruby```

#### RHEL or CentOS: Installed with `yum`
[installed-with-yum]: #rhel-or-centos-installed-with-yum

Follow these directions for [upgrading Ruby on CentOS](http://ask.xmodulo.com/upgrade-ruby-centos.html).
(They also include instructions for troubleshooting OpenSSL.)

#### Windows: Installed with Ruby Installer
[windows-ruby-installer]: #windows-installed-with-ruby-installer

From the Control Panel, find the Ruby installer in “Programs”. Click on the folder, and click
again on “Uninstall Ruby”.
Reinstall by downloading [Ruby and the Ruby DevKit](https://rubyinstaller.org/downloads/) at RubyInstaller.


## Additional Help

### Running another automated SSL check
[another-automated-ssl-check]: #running-another-automated-ssl-check

Rerun the automated [SSL check][ssl-check] to verify if the issue lies with an SSL issue
or a TLS issue. If you've already followed the troubleshooting steps above and are still
encountering an issue, go to the [creating an issue][creating-an-issue] section below for next steps.

### Creating an issue
[creating-an-issue]: #creating-an-issue

If none of these instructions fixed the problem, the next step is to open an issue.

(Create an issue in the [RubyGems issue tracker](https://github.com/rubygems/rubygems/issues)
if your error came from `gem install`. If it came from `bundle install`, create an issue in
the [Bundler issue tracker](https://github.com/rubygems/rubygems/issues/new?labels=Bundler&template=bundler-related-issue.md).)

Please include:

- The output from running `gem env`:
- The output from running `bundle env`:
- Output from running `ruby -ropenssl -e 'puts OpenSSL::OPENSSL_LIBRARY_VERSION'`:
- Your Ruby version manager (if any):
- Your OS and OS version:
- Your package manager name and version (if applicable):
