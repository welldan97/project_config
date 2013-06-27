require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :toggle

desc 'Initialize configs dir'
task :init do
  path = ENV['PROJECT_CONFIGS_PATH']
  dirname = File.dirname path
  FileUtils.mkdir_p dirname
  File.symlink "#{File.dirname(__FILE__)}/configs", path
end

desc 'Lock configs folder'
task :lock do
  `chown root configs`
  `chmod 700 configs`
  puts "Locked"
end

desc 'Unlock configs folder'
task :unlock do
  `chmod 755 configs`
  `chown #{current_user} configs`
  puts "Unlocked"
end

desc 'Lock or unlock configs folder'
task :toggle do
  if file_mode('configs') == '755'
    Rake::Task['lock'].invoke
  else
    Rake::Task['unlock'].invoke
  end
end

def current_user
  `who am i | cut -f1 -d ' '`.chomp
end

def file_mode file
  File.stat('configs').mode.to_s(8)[-3..-1]
end
