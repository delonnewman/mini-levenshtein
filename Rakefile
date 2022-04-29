# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/dsl_definition"
require "rake"
require "rake/extensiontask"
require "rspec"

RSpec::Core::RakeTask.new(:spec) do |rspec|
  rspec.pattern = FileList["spec/**/*_spec.rb"]
end

Rake::ExtensionTask.new("mini_levenshtein") do |extension|
  extension.ext_dir = "ext/mini_levenshtein"
  extension.lib_dir = "lib/mini-levenshtein"
end

Rake::Task[:spec].prerequisites << :compile

desc "open an irb session preloaded with this gem"
task :console do
  sh "bundle exec pry -r pp -r ./lib/mini-levenshtein.rb"
end
