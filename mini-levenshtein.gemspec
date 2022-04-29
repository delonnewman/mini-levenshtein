# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini-levenshtein/version'

Gem::Specification.new do |s|
  s.name = 'mini-levenshtein'
  s.version = MiniLevenshtein::VERSION
  s.authors = ['Delon Newman']
  s.email = 'contact@delonnewman.name'

  s.summary = 'Simple, fast, levenshtein distance & ratio'
  s.description = s.summary
  s.homepage = 'https://github.com/delonnewman/mini-levenshtein'
  s.license = 'MIT'

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'

    s.metadata['homepage_uri'] = s.homepage
    s.metadata['source_code_uri'] = s.homepage
    s.metadata['changelog_uri'] = "#{s.homepage}#changelog"
    s.metadata['documentation_uri'] = "https://www.rubydoc.info/gems/#{s.name}"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.extensions = ['ext/mini_levenshtein/extconf.rb']
  s.require_paths = ['lib']
end
