# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project_config/version'

Gem::Specification.new do |gem|
  gem.name          = "project_config"
  gem.version       = ProjectConfig::VERSION
  gem.authors       = ["Dmitry Yakimov"]
  gem.email         = ["welldan97@gmail.com"]
  gem.description   = %q{Makes configuration easier}
  gem.summary       = %q{Provides a tool to fetch project configuration from yaml repo}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'settingslogic', '~> 2.0.9'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.13.0'
end
