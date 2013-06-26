require 'settingslogic'
require "project_config/version"

module ProjectConfig
  class ProjectSettings < Settingslogic
  end

  def self.setup name, options={}
    ProjectSettings.source "#{ENV['PROJECT_CONFIGS_PATH']}/#{name}/config.yaml"
    ProjectSettings.namespace options[:environment] if options[:environment]
    ProjectSettings.load!
  end

  def self.method_missing(method, *args)
    super if method == :to_ary
    ProjectSettings.send method, *args
  end
end

def setup_project_config *args
  ProjectConfig.setup *args
end
