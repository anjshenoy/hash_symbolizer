#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :Test
Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.warning = true
  t.verbose = true
end
