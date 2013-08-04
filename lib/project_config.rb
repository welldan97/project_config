require 'settingslogic'
require "project_config/version"

module ProjectConfig

  class ProjectSettings < Settingslogic
  end

  class EnvSettings
    def self.method_missing(method, *args)
      super if method == :to_ary
      ENV[method.to_s]
    end
  end

  def self.setup name, options={}
    @source = if options[:source] == :env
                EnvSettings
              else
                ProjectSettings
              end
    ProjectSettings.source "#{ENV['PROJECT_CONFIGS_PATH']}/#{name}/config.yaml"
    ProjectSettings.namespace options[:environment] if options[:environment]
    ProjectSettings.load!
  end

  def self.method_missing(method, *args)
    super if method == :to_ary

    @source.send method, *args
  end
end

def setup_project_config *args
  ProjectConfig.setup *args
end
