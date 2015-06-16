Jekyll plugins by iiegn
=======================

Collection of plugins for the Jekyll static site generator.


Overview
--------

Plugins included in this repository:

* **hyphenate.rb** - Provides a hyphenation filter using [text-hyphen](https://rubygems.org/gems/text-hyphen)

Usage
-----

### hyphenate.rb

By default the filter hyphenates content of all text nodes. You probably want
to use this like ``{{ content | hyphenate }}``.  Also, adjust line 11 to match
your language and left/right number of chars.

Requires [Nokogiri](http://nokogiri.org/) & [text-hyphen](https://rubygems.org/gems/text-hyphen) gems.


Author
------

hyphenate.rb originally written by Janne Ala-Äijälä of [Aucor Oy](http://www.aucor.fi)
