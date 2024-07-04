---
layout: default
title: Specification Reference
url: /specification-reference
previous: /patterns
next: /command-reference
---



<p>The Specification class contains the information for a gem.  Typically defined in a .gemspec file or a Rakefile, and looks like this:</p>

<pre class="ruby"><span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Specification</span>.<span class="ruby-identifier">new</span> <span class="ruby-keyword">do</span> <span class="ruby-operator">|</span><span class="ruby-identifier">s</span><span class="ruby-operator">|</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">name</span>        = <span class="ruby-string">&#39;example&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">version</span>     = <span class="ruby-string">&#39;0.1.0&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">licenses</span>    = [<span class="ruby-string">&#39;MIT&#39;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">summary</span>     = <span class="ruby-string">&quot;This is an example!&quot;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">description</span> = <span class="ruby-string">&quot;Much longer explanation of the example!&quot;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">authors</span>     = [<span class="ruby-string">&quot;Ruby Coder&quot;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">email</span>       = <span class="ruby-string">&#39;rubycoder@example.com&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">files</span>       = [<span class="ruby-string">&quot;lib/example.rb&quot;</span>]
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">homepage</span>    = <span class="ruby-string">&#39;https://rubygems.org/gems/example&#39;</span>
  <span class="ruby-identifier">s</span>.<span class="ruby-identifier">metadata</span>    = { <span class="ruby-string">&quot;source_code_uri&quot;</span> <span class="ruby-operator">=&gt;</span> <span class="ruby-string">&quot;https://github.com/example/example&quot;</span> }
<span class="ruby-keyword">end</span>
</pre>

<p>Starting in RubyGems 2.0, a Specification can hold arbitrary metadata.  See <code>metadata</code> for restrictions on the format and size of metadata items you may add to a specification.</p>



## Required gemspec attributes
    
* [authors=](#authors=)
    
* [files](#files)
    
* [name](#name)
    
* [summary](#summary)
    
* [version](#version)
    
## Recommended gemspec attributes
    
* [description](#description)
    
* [email](#email)
    
* [homepage](#homepage)
    
* [license=](#license=)
    
* [licenses=](#licenses=)
    
* [metadata](#metadata)
    
* [required_ruby_version](#required_ruby_version)
    
## Read-only attributes
    
* [extensions_dir](#extensions_dir)
    
* [rubygems_version](#rubygems_version)
    
## Optional gemspec attributes
    
* [add_dependency](#add_dependency)
    
* [add_development_dependency](#add_development_dependency)
    
* [author=](#author=)
    
* [bindir](#bindir)
    
* [cert_chain](#cert_chain)
    
* [executables](#executables)
    
* [extensions](#extensions)
    
* [extra_rdoc_files](#extra_rdoc_files)
    
* [platform=](#platform=)
    
* [post_install_message](#post_install_message)
    
* [rdoc_options](#rdoc_options)
    
* [require_paths=](#require_paths=)
    
* [required_ruby_version=](#required_ruby_version=)
    
* [required_rubygems_version](#required_rubygems_version)
    
* [required_rubygems_version=](#required_rubygems_version=)
    
* [requirements](#requirements)
    
* [signing_key](#signing_key)
    


# Required gemspec attributes


<a id="authors="> </a>

## authors=(`value`)

<p>A list of authors for this gem.</p>

<p>Alternatively, a single author can be specified by assigning a string to <code>spec.author</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">authors</span> = [<span class="ruby-string">&#39;John Jones&#39;</span>, <span class="ruby-string">&#39;Mary Smith&#39;</span>]
</pre>

<a id="files"> </a>

## files

<p>Files included in this gem.  You cannot append to this accessor, you must assign to it.</p>

<p>Only add files you can require to this list, not directories, etc.</p>

<p>Directories are automatically stripped from this list when building a gem, other non-files cause an error.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">require</span> <span class="ruby-string">&#39;rake&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> = <span class="ruby-constant">FileList</span>[<span class="ruby-string">&#39;lib/**/*.rb&#39;</span>,
                      <span class="ruby-string">&#39;bin/*&#39;</span>,
                      <span class="ruby-string">&#39;[A-Z]*&#39;</span>].<span class="ruby-identifier">to_a</span>

<span class="ruby-comment"># or without Rake...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> = <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;lib/**/*.rb&#39;</span>] <span class="ruby-operator">+</span> <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;bin/*&#39;</span>]
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span> <span class="ruby-operator">+=</span> <span class="ruby-constant">Dir</span>[<span class="ruby-string">&#39;[A-Z]*&#39;</span>]
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">files</span>.<span class="ruby-identifier">reject!</span> { <span class="ruby-operator">|</span><span class="ruby-identifier">fn</span><span class="ruby-operator">|</span> <span class="ruby-identifier">fn</span>.<span class="ruby-identifier">include?</span> <span class="ruby-string">&quot;CVS&quot;</span> }
</pre>

<a id="name"> </a>

## name

<p>This gem’s name.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">name</span> = <span class="ruby-string">&#39;rake&#39;</span>
</pre>

<a id="summary"> </a>

## summary

<p>A short summary of this gem’s description.  Displayed in <code>gem list -d</code>.</p>

<p>The <code>description</code> should be more detailed than the summary.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">summary</span> = <span class="ruby-string">&quot;This is a small summary of my gem&quot;</span>
</pre>

<a id="version"> </a>

## version

<p>This gem’s version.</p>

<p>The version string can contain numbers and periods, such as <code>1.0.0</code>. A gem is a ‘prerelease’ gem if the version has a letter in it, such as <code>1.0.0.pre</code>.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">version</span> = <span class="ruby-string">&#39;0.4.1&#39;</span>
</pre>

# Recommended gemspec attributes


<a id="description"> </a>

## description

<p>A long description of this gem</p>

<p>The description should be more detailed than the summary but not excessively long.  A few paragraphs is a recommended length with no examples or formatting.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">description</span> = <span class="ruby-identifier">&lt;&lt;~EOF</span>
<span class="ruby-value">  Rake is a Make-like program implemented in Ruby. Tasks and
  dependencies are specified in standard Ruby syntax.
</span><span class="ruby-identifier">EOF</span>
</pre>

<a id="email"> </a>

## email

<p>A contact email address (or addresses) for this gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">email</span> = <span class="ruby-string">&#39;john.jones@example.com&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">email</span> = [<span class="ruby-string">&#39;jack@example.com&#39;</span>, <span class="ruby-string">&#39;jill@example.com&#39;</span>]
</pre>

<a id="homepage"> </a>

## homepage

<p>The URL of this gem’s home page</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">homepage</span> = <span class="ruby-string">&#39;https://github.com/ruby/rake&#39;</span>
</pre>

<a id="license="> </a>

## license=(`o`)

<p>The license for this gem.</p>

<p>The license must be no more than 64 characters.</p>

<p>This should just be the name of your license. The full text of the license should be inside of the gem (at the top level) when you build it.</p>

<p>The simplest way is to specify the standard SPDX ID <a href="https://spdx.org/licenses">spdx.org/licenses</a>/ for the license. Ideally, you should pick one that is OSI (Open Source Initiative) <a href="https://opensource.org/licenses">opensource.org/licenses</a>/ approved.</p>

<p>The most commonly used OSI-approved licenses are MIT and Apache-2.0. GitHub also provides a license picker at <a href="https://choosealicense.com">choosealicense.com</a>/.</p>

<p>You can also use a custom license file along with your gemspec and specify a LicenseRef-&lt;idstring&gt;, where idstring is the name of the file containing the license text.</p>

<p>You should specify a license for your gem so that people know how they are permitted to use it and any restrictions you’re placing on it.  Not specifying a license means all rights are reserved; others have no right to use the code for any purpose.</p>

<p>You can set multiple licenses with <code>licenses=</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">license</span> = <span class="ruby-string">&#39;MIT&#39;</span>
</pre>

<a id="licenses="> </a>

## licenses=(`licenses`)

<p>The license(s) for the library.</p>

<p>Each license must be a short name, no more than 64 characters.</p>

<p>This should just be the name of your license. The full text of the license should be inside of the gem when you build it.</p>

<p>See <code>license=</code> for more discussion</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">licenses</span> = [<span class="ruby-string">&#39;MIT&#39;</span>, <span class="ruby-string">&#39;GPL-2.0&#39;</span>]
</pre>

<a id="metadata"> </a>

## metadata

<p>The metadata holds extra data for this gem that may be useful to other consumers and is settable by gem authors.</p>

<p>Metadata items have the following restrictions:</p>
<ul><li>
<p>The metadata must be a Hash object</p>
</li><li>
<p>All keys and values must be Strings</p>
</li><li>
<p>Keys can be a maximum of 128 bytes and values can be a maximum of 1024 bytes</p>
</li><li>
<p>All strings must be UTF-8, no binary data is allowed</p>
</li></ul>

<p>You can use metadata to specify links to your gem’s homepage, codebase, documentation, wiki, mailing list, issue tracker and changelog.</p>

<pre>s.metadata = {
  &quot;bug_tracker_uri&quot;   =&gt; &quot;https://example.com/user/bestgemever/issues&quot;,
  &quot;changelog_uri&quot;     =&gt; &quot;https://example.com/user/bestgemever/CHANGELOG.md&quot;,
  &quot;documentation_uri&quot; =&gt; &quot;https://www.example.info/gems/bestgemever/0.0.1&quot;,
  &quot;homepage_uri&quot;      =&gt; &quot;https://bestgemever.example.io&quot;,
  &quot;mailing_list_uri&quot;  =&gt; &quot;https://groups.example.com/bestgemever&quot;,
  &quot;source_code_uri&quot;   =&gt; &quot;https://example.com/user/bestgemever&quot;,
  &quot;wiki_uri&quot;          =&gt; &quot;https://example.com/user/bestgemever/wiki&quot;
  &quot;funding_uri&quot;       =&gt; &quot;https://example.com/donate&quot;
}</pre>

<p>These links will be used on your gem’s page on rubygems.org and must pass validation against following regex.</p>

<pre class="ruby"><span class="ruby-regexp">%r{\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\z}</span>
</pre>

<a id="required_ruby_version"> </a>

## required_ruby_version

<p>The version of Ruby required by this gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 2.7.0&#39;</span>
</pre>

# Read-only attributes


<a id="extensions_dir"> </a>

## extensions_dir

<p>The path where this gem installs its extensions.</p>

<a id="rubygems_version"> </a>

## rubygems_version

<p>The version of RubyGems used to create this gem.</p>

# Optional gemspec attributes


<a id="add_dependency"> </a>

## add_dependency(`gem`, `*requirements`)

<p>Adds a runtime dependency named <code>gem</code> with <code>requirements</code> to this gem.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">add_dependency</span> <span class="ruby-string">&#39;example&#39;</span>, <span class="ruby-string">&#39;~&gt; 1.1&#39;</span>, <span class="ruby-string">&#39;&gt;= 1.1.4&#39;</span>
</pre>
Also known as: **add_runtime_dependency**

<a id="add_development_dependency"> </a>

## add_development_dependency(`gem`, `*requirements`)

<p>Adds a development dependency named <code>gem</code> with <code>requirements</code> to this gem.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">add_development_dependency</span> <span class="ruby-string">&#39;example&#39;</span>, <span class="ruby-string">&#39;~&gt; 1.1&#39;</span>, <span class="ruby-string">&#39;&gt;= 1.1.4&#39;</span>
</pre>

<p>Development dependencies aren’t installed by default and aren’t activated when a gem is required.</p>

<a id="author="> </a>

## author=(`o`)

<p>Singular (alternative) writer for <code>authors</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">author</span> = <span class="ruby-string">&#39;John Jones&#39;</span>
</pre>

<a id="bindir"> </a>

## bindir

<p>The path in the gem for executable scripts.  Usually ‘exe’</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">bindir</span> = <span class="ruby-string">&#39;exe&#39;</span>
</pre>

<a id="cert_chain"> </a>

## cert_chain

<p>The certificate chain used to sign this gem.  See Gem::Security for details.</p>

<a id="executables"> </a>

## executables

<p>Executables included in the gem.</p>

<p>For example, the rake gem has rake as an executable. You don’t specify the full path (as in bin/rake); all application-style files are expected to be found in bindir.  These files must be executable Ruby files.  Files that use bash or other interpreters will not work.</p>

<p>Executables included may only be ruby scripts, not scripts for other languages or compiled binaries.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">executables</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;rake&#39;</span>
</pre>

<a id="extensions"> </a>

## extensions

<p>Extensions to build when installing the gem, specifically the paths to extconf.rb-style files used to compile extensions.</p>

<p>These files will be run when the gem is installed, causing the C (or whatever) code to be compiled on the user’s machine.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">extensions</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;ext/rmagic/extconf.rb&#39;</span>
</pre>

<p>See Gem::Ext::Builder for information about writing extensions for gems.</p>

<a id="extra_rdoc_files"> </a>

## extra_rdoc_files

<p>Extra files to add to RDoc such as README or doc/examples.txt</p>

<p>When the user elects to generate the RDoc documentation for a gem (typically at install time), all the library files are sent to RDoc for processing. This option allows you to have some non-code files included for a more complete set of documentation.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">extra_rdoc_files</span> = [<span class="ruby-string">&#39;README&#39;</span>, <span class="ruby-string">&#39;doc/user-guide.txt&#39;</span>]
</pre>

<a id="platform="> </a>

## platform=(`platform`)

<p>The platform this gem runs on.</p>

<p>This is usually Gem::Platform::RUBY or Gem::Platform::CURRENT.</p>

<p>Most gems contain pure Ruby code; they should simply leave the default value in place.  Some gems contain C (or other) code to be compiled into a Ruby “extension”.  The gem should leave the default value in place unless the code will only compile on a certain type of system.  Some gems consist of pre-compiled code (“binary gems”).  It’s especially important that they set the platform attribute appropriately.  A shortcut is to set the platform to Gem::Platform::CURRENT, which will cause the gem builder to set the platform to the appropriate value for the system on which the build is being performed.</p>

<p>If this attribute is set to a non-default value, it will be included in the filename of the gem when it is built such as: nokogiri-1.6.0-x86-mingw32.gem</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">platform</span> = <span class="ruby-constant">Gem</span><span class="ruby-operator">::</span><span class="ruby-constant">Platform</span>.<span class="ruby-identifier">local</span>
</pre>

<a id="post_install_message"> </a>

## post_install_message

<p>A message that gets displayed after the gem is installed.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">post_install_message</span> = <span class="ruby-string">&quot;Thanks for installing!&quot;</span>
</pre>

<a id="rdoc_options"> </a>

## rdoc_options

<p>Specifies the rdoc options to be used when generating API documentation.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">rdoc_options</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;--title&#39;</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;Rake -- Ruby Make&#39;</span> <span class="ruby-operator">&lt;&lt;</span>
  <span class="ruby-string">&#39;--main&#39;</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;README&#39;</span> <span class="ruby-operator">&lt;&lt;</span>
  <span class="ruby-string">&#39;--line-numbers&#39;</span>
</pre>

<a id="require_paths="> </a>

## require_paths=(`val`)

<p>Paths in the gem to add to <code>$LOAD_PATH</code> when this gem is activated. If you have an extension you do not need to add <code>&quot;ext&quot;</code> to the require path, the extension build process will copy the extension files into “lib” for you.</p>

<p>The default value is <code>&quot;lib&quot;</code></p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-comment"># If all library files are in the root directory...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">require_paths</span> = [<span class="ruby-string">&#39;.&#39;</span>]
</pre>

<a id="required_ruby_version="> </a>

## required_ruby_version=(`req`)

<p>The version of Ruby required by this gem.  The ruby version can be specified to the patch-level:</p>

<pre>$ ruby -v -e &#39;p Gem.ruby_version&#39;
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
#&lt;Gem::Version &quot;2.0.0.247&quot;&gt;</pre>

<p>Prereleases can also be specified.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-comment"># This gem will work with 1.8.6 or greater...</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 1.8.6&#39;</span>

<span class="ruby-comment"># Only with final releases of major version 2 where minor version is at least 3</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;~&gt; 2.3&#39;</span>

<span class="ruby-comment"># Only prereleases or final releases after 2.6.0.preview2</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt; 2.6.0.preview2&#39;</span>

<span class="ruby-comment"># This gem will work with 2.3.0 or greater, including major version 3, but lesser than 4.0.0</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">required_ruby_version</span> = <span class="ruby-string">&#39;&gt;= 2.3&#39;</span>, <span class="ruby-string">&#39;&lt; 4&#39;</span>
</pre>

<a id="required_rubygems_version"> </a>

## required_rubygems_version

<p>The RubyGems version required by this gem</p>

<a id="required_rubygems_version="> </a>

## required_rubygems_version=(`req`)

<p>The RubyGems version required by this gem</p>

<a id="requirements"> </a>

## requirements

<p>Lists the external (to RubyGems) requirements that must be met for this gem to work.  It’s simply information for the user.</p>

<p>Usage:</p>

<pre class="ruby"><span class="ruby-identifier">spec</span>.<span class="ruby-identifier">requirements</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;libmagick, v6.0&#39;</span>
<span class="ruby-identifier">spec</span>.<span class="ruby-identifier">requirements</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">&#39;A good graphics card&#39;</span>
</pre>

<a id="signing_key"> </a>

## signing_key

<p>The key used to sign this gem.  See Gem::Security for details.</p>


<!--<html -->
