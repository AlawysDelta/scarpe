# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

Rake::TestTask.new(:lacci_test) do |t|
  t.libs << "lacci/test"
  t.libs << "lacci/lib"
  t.test_files = FileList["lacci/test/**/test_*.rb"]
end

RuboCop::RakeTask.new

task default: [:test, :lacci_test, :rubocop]
