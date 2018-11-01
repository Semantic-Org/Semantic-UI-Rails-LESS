require 'bundler/gem_tasks'

load 'tasks/update.rake'

task default: :spec

desc 'Run all specs'
task :spec do
  require 'minispec'
  Minispec.run
end
