---
layout: default
title: C Extensions
previous: /run-your-own-gem-server
next: /resources
---

This guide explains how to make a C extension and package it as a gem.

We'll continue the `hola` example gem from the [make your own gem](/make-your-own-gem) guide.
At the end of that guide, it looked something like this:

    % tree
    .
    ├── Rakefile
    ├── bin
    │   └── hola
    ├── hola.gemspec
    ├── lib
    │   ├── hola
    │   │   └── translator.rb
    │   └── hola.rb
    └── test
        └── test_hola.rb

<a id="ext-folder"> </a>
Create an `ext` Folder
----------------------

Whereas the ruby source for the gem lives in the `lib` folder, the C source for the
extension will live in a folder called `ext`.

The name of the main C source file is important.
For reasons that we'll get into later, a good name is `<gem name>_ext.c`; in this case, that's `hola_ext.c`.

The `hola_ext.c`

    % cat ext/hola_ext.c    
    #include <ruby.h>
    
    static VALUE hola_bonjour(VALUE self) {
      return rb_str_new2("bonjour!");
    }
    
    void Init_hola_ext(void) {
      VALUE klass = rb_define_class("Hola");
      rb_define_singleton_method(klass, "bonjour", hola_bonjour, 0);
    }
    
Tieing it Together
------------------
