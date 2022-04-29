# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "mini-levenshtein/version"

Gem::Specification.new do |s|
  s.required_ruby_version = ">= 2.4"
  s.name = "mini-levenshtein"
  s.version = MiniLevenshtein::VERSION
  s.homepage = "https://github.com/combinaut/mini-levenshtein"
  s.authors = ["Combinaut Team"]
  s.email = "hello@combinaut.com"
  s.license = "MIT"
  s.summary = "Simple, fast, levenshtein distance"
  s.description = "This gem implements pure Levenshtein algorithm"
  s.files = `git ls-files -z`.split("\x0").
            reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.extensions = ["ext/mini_levenshtein/extconf.rb"]
  s.require_paths = ["lib", "lib/mini-levenshtein"]

  s.add_development_dependency "bundler", "~> 2.1"
  s.add_development_dependency "byebug", "~> 11.0"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rake-compiler", "~> 1.1"
  s.add_development_dependency "rspec", "~> 3.9"
  s.add_development_dependency "rubocop", "~> 0.88"
  s.add_development_dependency "ruby-prof", "~> 1.4"
end
