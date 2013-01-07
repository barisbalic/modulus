#!/usr/bin/env rake
require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler"
  exit -1
end

require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |test|
  test.verbose = true
  test.libs << "test"
  test.libs << "spec"
  test.libs << "lib"
  # test.test_files = FileList['spec/**/*_spec.rb']
  test.test_files = FileList['test/**/*_test.rb', 'spec/**/*_spec.rb']
  # test.test_files = FileList['test/**/*_test.rb']
end
task :default => :test
