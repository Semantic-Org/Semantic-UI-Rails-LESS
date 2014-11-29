require 'spec_helper'
require 'rails/generators/testing/behaviour'
require 'generators/semantic_ui/install/install_generator'

describe SemanticUi::InstallGenerator do
  include FileUtils

  let(:generator) { SemanticUi::InstallGenerator }

  let(:dummy_app) { Dummy::Application }
  let(:dummy_assets) { dummy_app.assets }
  let(:dummy_app_root) { File.expand_path('../dummy_app', __dir__) }

  before_all do
    capture(:stdout) do
      generator.start([], destination_root: dummy_app_root)
    end

    dummy_app.initialize! unless dummy_app.initialized?
  end

  after_all do
    rm_rf File.join(dummy_app.config.root, 'vendor')
  end

  describe 'installed files' do

    helper :file_exists? do |file|
      assert(File.exists?(file)) == true
    end

    let(:javascripts_dir) { File.join(dummy_app_root, 'vendor', 'assets', 'javascripts') }
    let(:stylesheets_dir) { File.join(dummy_app_root, 'vendor', 'assets', 'stylesheets') }

    it 'has semantic_ui.js' do
      expect(File.join(javascripts_dir, 'semantic_ui', 'semantic_ui.js')).file_exists?
    end

    it 'has semantic_ui.css' do
      expect(File.join(stylesheets_dir, 'semantic_ui', 'semantic_ui.css')).file_exists?
    end

    it 'has theme.config' do
      expect(File.join(stylesheets_dir, 'semantic_ui', 'theme.config')).file_exists?
    end

    it 'has config/**/*.overrides' do
      expect(Dir[File.join(stylesheets_dir, 'semantic_ui', 'config', '**', '*.overrides')]).is.not.empty?
    end

    it 'has config/**/*.variables' do
      expect(Dir[File.join(stylesheets_dir, 'semantic_ui', 'config', '**', '*.variables')]).is.not.empty?
    end

  end

  describe 'application.css' do
    let(:application_css) { dummy_assets['application.css'].to_s.strip }

    it 'should include semantic_ui.css' do
      expect(application_css).to.include?('.ui.button')
    end

    it 'should include correct paths to images' do
      expect(application_css).to.include?('/semantic_ui/themes/default/assets/images/flags.png')
    end

    it 'should include correct paths to fonts' do
      expect(application_css).to.include?('/semantic_ui/themes/default/assets/fonts/icons.ttf')
    end
  end

  describe 'application.js' do
    let(:application_js) { dummy_assets['application.js'].to_s.strip }

    it 'should include semantic_ui.js' do
      expect(application_js).to.include?('$.site')
    end
  end
end