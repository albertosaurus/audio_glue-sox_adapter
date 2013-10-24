# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name        = "audio_glue-sox_adapter"
  gem.homepage    = "http://github.com/TMXCredit/audio_glue-sox_adapter"
  gem.license     = "MIT"
  gem.summary     = "AudioGlue adapter based on sox command line tool"
  gem.description = gem.summary
  gem.authors     = ['TMX Credit'            , 'Potapov Sergey']
  gem.email       = ['rubygems@tmxcredit.com', 'blake131313@gmail.com']
  gem.files       = Dir["lib/**/*"] + Dir['README.markdown', 'LICENSE.txt']
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
