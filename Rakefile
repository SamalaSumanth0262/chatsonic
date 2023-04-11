require 'rake'
require 'rubocop/rake_task'
require "rspec/core/rake_task"

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-performance'
  task.requires << 'rubocop-rspec'
end


RSpec::Core::RakeTask.new(:spec)

task default: :spec