# mini-levenshtein

Simple, fast, levenshtein distance

# Synopsis

```ruby
MiniLevenshtein.distance("levenshtein", "levenstien") # => 3

MiniLevenshtein.ratio("levenshtein", "levenstien") # 0.857142...
```

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

[GPL](https://opensource.org/licenses/GPL-2.0)
