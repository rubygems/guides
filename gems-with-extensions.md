---
layout: default
title: Gems with Extensions
url: /gems-with-extensions
previous: /make-your-own-gem
next: /name-your-gem
redirect_from: /c-extensions/
---

<em class="text-neutral-600">Creating a gem that includes an extension that is built at install time.</em>

Many gems use extensions to wrap libraries that are written in C with a ruby
wrapper.  Examples include [nokogiri][nokogiri] which
wraps [libxml2 and libxslt](http://www.xmlsoft.org),
[pg](https://rubygems.org/gems/pg) which is an interface to the [PostgreSQL
database](https://www.postgresql.org) and the
[mysql](https://rubygems.org/gems/mysql) and
[mysql2](https://rubygems.org/gems/mysql2) gems which provide an interface to
the [MySQL database](https://www.mysql.com).

Creating a gem that uses an extension involves several steps.  This guide will
focus on what you should put in your gem specification to make this as easy and
maintainable as possible.  The extension in this guide will wrap `malloc()` and
`free()` from the C standard library.

Extensions don't have to be written in C.  This guide uses C for its main
example, but you can also write extensions in [Rust](#rust-extensions); see the
Rust Extensions section below.

Gem layout
----------

Every gem should start with a Rakefile which contains the tasks needed by
developers to work on the gem.  The files for the extension should go in the
`ext/` directory in a directory matching the extension's name.  For this
example we'll use "my_malloc" for the name.

Some extensions will be partially written in C and partially written in ruby.
If you are going to support multiple languages, such as C and Java extensions,
you should put the C-specific ruby files under the `ext/` directory as well in a
`lib/` directory.

    Rakefile
    ext/my_malloc/extconf.rb               # extension configuration
    ext/my_malloc/my_malloc.c              # extension source
    lib/my_malloc.rb                       # generic features

When the extension is built the files in `ext/my_malloc/lib/` will be installed
into the `lib/` directory for you.

extconf.rb
----------

The extconf.rb configures a Makefile that will build your extension.  The
extconf.rb must check for the necessary functions, macros and shared libraries
your extension depends upon.  The extconf.rb must exit with an error if any of
these are missing.

Here is an extconf.rb that checks for `malloc()` and `free()` and creates a
Makefile that will install the built extension at `lib/my_malloc/my_malloc.so`:

    require "mkmf"

    abort "missing malloc()" unless have_func "malloc"
    abort "missing free()"   unless have_func "free"

    create_makefile "my_malloc/my_malloc"

See the [mkmf documentation][mkmf.rb] and [extension.rdoc][extension.rdoc] for further
information about creating an extconf.rb and for documentation on these
methods.

C Extension
-----------

The C extension that wraps `malloc()` and `free()` goes in
`ext/my_malloc/my_malloc.c`.  Here's the listing:

    #include <ruby.h>

    struct my_malloc {
      size_t size;
      void *ptr;
    };

    static void
    my_malloc_free(void *p) {
      struct my_malloc *ptr = p;

      if (ptr->size > 0)
        free(ptr->ptr);
    }

    static VALUE
    my_malloc_alloc(VALUE klass) {
      VALUE obj;
      struct my_malloc *ptr;

      obj = Data_Make_Struct(klass, struct my_malloc, NULL, my_malloc_free, ptr);

      ptr->size = 0;
      ptr->ptr  = NULL;

      return obj;
    }

    static VALUE
    my_malloc_init(VALUE self, VALUE size) {
      struct my_malloc *ptr;
      size_t requested = NUM2SIZET(size);

      if (0 == requested)
        rb_raise(rb_eArgError, "unable to allocate 0 bytes");

      Data_Get_Struct(self, struct my_malloc, ptr);

      ptr->ptr = malloc(requested);

      if (NULL == ptr->ptr)
        rb_raise(rb_eNoMemError, "unable to allocate %ld bytes", requested);

      ptr->size = requested;

      return self;
    }

    static VALUE
    my_malloc_release(VALUE self) {
      struct my_malloc *ptr;

      Data_Get_Struct(self, struct my_malloc, ptr);

      if (0 == ptr->size)
        return self;

      ptr->size = 0;
      free(ptr->ptr);

      return self;
    }

    void
    Init_my_malloc(void) {
      VALUE cMyMalloc;

      cMyMalloc = rb_const_get(rb_cObject, rb_intern("MyMalloc"));

      rb_define_alloc_func(cMyMalloc, my_malloc_alloc);
      rb_define_method(cMyMalloc, "initialize", my_malloc_init, 1);
      rb_define_method(cMyMalloc, "free", my_malloc_release, 0);
    }

This extension is simple with just a few parts:

* `struct my_malloc` to hold the allocated memory
* `my_malloc_free()` to free the allocated memory after garbage collection
* `my_malloc_alloc()` to create the ruby wrapper object
* `my_malloc_init()` to allocate memory from ruby
* `my_malloc_release()` to free memory from ruby
* `Init_my_malloc()` to register the functions in the `MyMalloc` class.

Now we can create the actual `MyMalloc` class and bind newly defined methods
in Ruby (`lib/my_malloc.rb` is the correct place for that), e.g.:

    class MyMalloc
      VERSION = "1.0"
    end

    require "my_malloc/my_malloc"


You can test building the extension as follows:

    $ cd ext/my_malloc
    $ ruby extconf.rb
    checking for malloc()... yes
    checking for free()... yes
    creating Makefile
    $ make
    compiling my_malloc.c
    linking shared-object my_malloc.bundle
    $ cd ../..
    $ ruby -Ilib:ext -r my_malloc -e "p MyMalloc.new(5).free"
    #<MyMalloc:0x007fed838addb0>

But this will get tedious after a while.  Let's automate it!

rake-compiler
-------------

[rake-compiler][rake-compiler] is a set of rake
tasks for automating extension building.  rake-compiler can be used with C or
Java extensions in the same project ([nokogiri][nokogiri] uses it this way).

First install the gem:

    $ gem install rake-compiler

Adding rake-compiler to the `Rakefile` is very simple:

    require "rake/extensiontask"

    Rake::ExtensionTask.new "my_malloc" do |ext|
      ext.lib_dir = "lib/my_malloc"
    end

Now you can build the extension with `rake compile` and hook the compile task
into other tasks (such as tests).

Setting `lib_dir` places the shared library in `lib/my_malloc/my_malloc.so` (or
`.bundle` or `.dll`).  This allows the top-level file for the gem to be a ruby
file.  This allows you to write the parts that are best suited to ruby in ruby.

For example:

    class MyMalloc

      VERSION = "1.0"

    end

    require "my_malloc/my_malloc"

Setting the `lib_dir` also allows you to build a gem that contains pre-built
extensions for multiple versions of ruby.  (An extension for Ruby 1.9.3 cannot
be used with an extension for Ruby 2.0.0).  `lib/my_malloc.rb` can pick the
correct shared library to install.

Gem specification
-----------------

The final step to building the gem is adding the extconf.rb to the extensions
list in the gemspec:

    Gem::Specification.new "my_malloc", "1.0" do |s|
      # [...]

      s.extensions = %w[ext/my_malloc/extconf.rb]
    end

Now you can build and release the gem!

Extension Naming
----------------

To avoid unintended interactions between gems, it's a good idea for each gem to
keep all of its files in a single directory.  Here are the recommendations for
a gem with the name `<name>`:

1. `ext/<name>` is the directory that contains the source files and
   `extconf.rb`
2. `ext/<name>/<name>.c` is the main source file (there may be others)
3. `ext/<name>/<name>.c` contains a function `Init_<name>`.  (The name
   following `Init_` function must exactly match the name of the extension for
   it to be loadable by require.)
4. `ext/<name>/extconf.rb` calls `create_makefile('<name>/<name>')` only when
   the all the pieces needed to compile the extension are present.
5. The gemspec sets `extensions = ['ext/<name>/extconf.rb']` and includes any
   of the necessary extension source files in the `files` list.
6. `lib/<name>.rb` contains `require '<name>/<name>'` which loads the C
   extension

Rust Extensions
---------------

Native extensions can also be written in [Rust][rust] instead of C.  Since
[RubyGems 3.3.11][pr-5175] a gem can declare a Rust extension that is compiled
at install time, giving you Rust's memory safety and the Cargo build system
while still producing an ordinary shared library that Ruby loads with `require`.

The recommended toolchain is maintained by the [oxidize-rb][oxidize-rb]
project:

* [rb-sys][rb-sys] wires Cargo into the standard `rake-compiler` workflow, so
  building, testing, and cross-compiling work the same way they do for C
  extensions.
* [magnus][magnus] provides a high-level, safe API for defining Ruby modules,
  classes, and methods from Rust.  You can drop down to the raw `rb-sys`
  bindings when you need to, but most gems should use magnus.

You'll need a [Rust toolchain][rustup] installed in addition to Ruby.

### Generating the gem

The quickest way to start is to let Bundler scaffold the whole project:

    $ bundle gem --ext=rust my_gem

This produces a working gem with all of the Rust wiring already in place:

    Cargo.toml                         # Cargo workspace
    Rakefile
    my_gem.gemspec
    ext/my_gem/Cargo.toml              # crate definition and dependencies
    ext/my_gem/extconf.rb              # extension configuration
    ext/my_gem/src/lib.rs              # extension source
    lib/my_gem.rb                      # generic features

The rest of this section walks through the pieces that differ from a C
extension.

### extconf.rb

Instead of `mkmf`'s `create_makefile`, a Rust extension uses
`create_rust_makefile` from `rb_sys/mkmf`.  It generates a Makefile that drives
Cargo:

    require "mkmf"
    require "rb_sys/mkmf"

    create_rust_makefile("my_gem/my_gem")

The argument is the install path of the compiled library, exactly like the
argument to `create_makefile`.  Here it places the shared object at
`lib/my_gem/my_gem.so`.

### Cargo.toml

Each extension is a Cargo crate.  The two things that matter for a Ruby
extension are the `cdylib` crate type, so Cargo produces a shared library Ruby
can load, and the `magnus` dependency:

    [package]
    name = "my_gem"
    version = "0.1.0"
    edition = "2021"
    publish = false

    [lib]
    crate-type = ["cdylib"]

    [dependencies]
    magnus = "0.8"

A `Cargo.toml` in the project root declares a [workspace][cargo-workspace] so
that editors and `cargo` commands run from the top of the gem behave correctly:

    [workspace]
    members = ["./ext/my_gem"]
    resolver = "2"

### The Rust source

`ext/my_gem/src/lib.rs` defines the extension.  The function marked with
`#[magnus::init]` is called when Ruby loads the library, and it's where you
define your modules, classes, and methods:

    use magnus::{function, prelude::*, Error, Ruby};

    fn hello(subject: String) -> String {
        format!("Hello {subject}, from Rust!")
    }

    #[magnus::init]
    fn init(ruby: &Ruby) -> Result<(), Error> {
        let module = ruby.define_module("MyGem")?;
        module.define_singleton_method("hello", function!(hello, 1))?;
        Ok(())
    }

magnus converts between Ruby and Rust types for you, so `hello` takes and
returns an ordinary Rust `String`.  Calling `MyGem.hello("world")` from Ruby
returns `"Hello world, from Rust!"`.

### Rakefile

`rb_sys` ships a drop-in replacement for `Rake::ExtensionTask` that knows how to
drive Cargo.  Use `RbSys::ExtensionTask` and it hooks into `rake compile` just
like the C workflow:

    require "rb_sys/extensiontask"

    task build: :compile

    GEMSPEC = Gem::Specification.load("my_gem.gemspec")

    RbSys::ExtensionTask.new("my_gem", GEMSPEC) do |ext|
      ext.lib_dir = "lib/my_gem"
    end

    task default: %i[compile test]

### lib/my_gem.rb

The top-level Ruby file requires the compiled library, just like a C extension:

    require_relative "my_gem/version"
    require "my_gem/my_gem"

    module MyGem
      class Error < StandardError; end
      # Your code goes here...
    end

### Gem specification

Point `extensions` at the `extconf.rb` and add a dependency on `rb_sys`:

    Gem::Specification.new do |spec|
      spec.name = "my_gem"
      spec.version = MyGem::VERSION
      # [...]

      spec.extensions = ["ext/my_gem/extconf.rb"]
      spec.add_dependency "rb_sys", ">= 0.9.128"
    end

Make sure the gemspec's `files` list includes the Rust sources and the
`Cargo.toml` files (for example `ext/**/*.rs` and `**/Cargo.*`) so they ship in
the packaged gem.  The scaffold generated by `bundle gem` already does this via
`git ls-files`.

### Building and testing locally

Compile the extension and try it out:

    $ bundle install
    $ bundle exec rake compile
    $ bundle exec ruby -Ilib -r my_gem -e "puts MyGem.hello('world')"
    Hello world, from Rust!

`rake compile` builds the crate with Cargo and copies the resulting shared
library into `lib/my_gem/`, where `lib/my_gem.rb` can `require` it.  From here
`rake test` works exactly as it would for a C extension.

Although Cargo omits `Cargo.lock` from version control for library crates by
default, you should commit it for a gem.  The native extension is built from
source on the user's machine at install time, so a checked-in `Cargo.lock`
gives everyone the same, reproducible set of Rust dependencies.  The
`.gitignore` generated by `bundle gem` ignores only the `target/` build
directory, leaving `Cargo.lock` tracked.

Further Reading
---------------

* [my_malloc](https://github.com/rubygems/guides/tree/my_malloc) contains the
  source for this extension with some additional comments.
* [extension.rdoc][extension.rdoc] describes in greater detail how to build
  extensions in ruby
* [MakeMakefile][mkmf.rb] contains documentation for mkmf.rb, the library
  extconf.rb uses to detect ruby and C library features
* [rake-compiler][rake-compiler] integrates building C and Java extensions into
  your Rakefile in a smooth manner.
* [Writing C extensions part
  1](https://tenderlovemaking.com/2009/12/18/writing-ruby-c-extensions-part-1.html)
  and [part 2](https://tenderlovemaking.com/2010/12/11/writing-ruby-c-extensions-part-2.html))
  by Aaron Patterson
* Interfaces to C libraries can be written using ruby and
  [fiddle](https://docs.ruby-lang.org/en/master/Fiddle.html) (part
  of the standard library) or [ruby-ffi](https://github.com/ffi/ffi)
* [The Ruby on Rust Book][rb-sys-book] is the official guide to writing
  extensions in Rust with rb-sys and magnus
* [magnus][magnus] provides the high-level Rust API used in the Rust example
  above
* [oxi-test][oxi-test] is a minimal, cross-compiled reference gem built with
  rb-sys

[extension.rdoc]: https://github.com/ruby/ruby/blob/master/doc/extension.rdoc
[mkmf.rb]: https://github.com/ruby/ruby/blob/master/lib/mkmf.rb
[rake-compiler]: https://github.com/luislavena/rake-compiler
[nokogiri]: https://rubygems.org/gems/nokogiri
[pr-5175]: https://github.com/rubygems/rubygems/pull/5175
[rust]: https://www.rust-lang.org
[rustup]: https://rustup.rs
[oxidize-rb]: https://github.com/oxidize-rb
[rb-sys]: https://github.com/oxidize-rb/rb-sys
[magnus]: https://github.com/matsadler/magnus
[cargo-workspace]: https://doc.rust-lang.org/cargo/reference/workspaces.html
[rb-sys-book]: https://oxidize-rb.github.io/rb-sys/
[oxi-test]: https://github.com/oxidize-rb/oxi-test
