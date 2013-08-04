require 'spec_helper'

describe ProjectConfig do
  before :all do
    ENV['PROJECT_CONFIGS_PATH'] = 'spec/fixtures/configs'
  end

  it "should initialize" do
    setup_project_config :project_name
  end

  it "returns config properties" do
    setup_project_config :project_name
    expect(ProjectConfig.user_name).to eq 'Bill Murray'
  end

  it "returns config namespaced properties" do
    setup_project_config :project_name, environment: 'production'
    ProjectConfig.reload! # tests fix
    expect(ProjectConfig.user_name).to eq 'Elvis Presley'
  end

  describe 'environment variables' do
    it 'get values from envirorment variables if source is specified as env' do
      ENV['user_name'] = 'Paul McCartney'
      setup_project_config :project_name, source: :env
      ProjectConfig.reload! # tests fix
      expect(ProjectConfig.user_name).to eq 'Paul McCartney'
    end
  end
end
