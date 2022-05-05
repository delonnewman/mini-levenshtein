[![Ruby](https://github.com/delonnewman/mini-levenshtein/actions/workflows/ruby.yml/badge.svg)](https://github.com/delonnewman/mini-levenshtein/actions/workflows/ruby.yml)

# MiniLevenshtein

Simple, fast, levenshtein distance for Ruby

# Synopsis

```ruby
MiniLevenshtein.edit_distance("levenshtein", "levenstien") # => 3

MiniLevenshtein.similarity("levenshtein", "levenstien") # 0.857142...
```

# Why?

While there are many levenshtein distance implementations for Ruby, none provided a means to adjust edit scoring to make the calcuations suitable for a similarity ratio.

# See Also

- [python-levenshtein](https://github.com/ztane/python-Levenshtein)
- [Various Ruby Implementations](https://rubygems.org/search?query=levenshtein)
- https://en.wikipedia.org/wiki/Levenshtein_distance

# Credits

## Ruby Bindings

Delon Newman <contact@delonnewman.name>

## Original C Code

- David Necas (Yeti) <yeti@physics.muni.cz>
- Atakan Gurkan
- James Theiler
- Brian Gough

(see [ext/mini_levenshtein/levenshtein.c](https://github.com/delonnewman/mini-levenshtein/blob/master/ext/mini_levenshtein/levenshtein.c) for more)

# License

The gem is available as open source under the terms of the [GPL](https://opensource.org/licenses/GPL-2.0).

# Support

<a href="https://www.buymeacoffee.com/delonnewman" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
