#!/usr/bin/env rake
# encoding: utf-8

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/{,*/}test_*.rb'
end

task :default => :test
