require 'rspec/core/rake_task'
require File.expand_path('../lib/application.rb', __FILE__)

# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'documentation']
end

task :default => :spec

desc "Runs the app"
task :run do

  input = ENV['INPUT'] || "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"

  puts "\nDeploying rovers..."
  puts "__________________________________________"
  puts "\nINPUT"
  puts input

  app    = Application.new input
  output = app.run

  puts "__________________________________________"
  puts "\nOUTPUT"
  puts output
end