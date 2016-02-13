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

  let(:javascripts_dir) { File.join(dummy_app_root, 'vendor', 'assets', 'javascripts') }
  let(:stylesheets_dir) { File.join(dummy_app_root, 'vendor', 'assets', 'stylesheets') }

  describe 'installed files' do

    helper :file_exists? do |file|
      assert(File.exists?(file)) == true
    end

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
    def application_css
      dummy_assets['application.css'].to_s.strip
    end

    it 'should include semantic_ui.css' do
      expect(application_css).to.include?('.ui.button')
    end

    it 'should include correct paths to images' do
      expect(application_css).to.include?('/semantic_ui/themes/default/assets/images/flags.png')
    end

    it 'should include correct paths to fonts' do
      expect(application_css).to.include?('/semantic_ui/themes/default/assets/fonts/icons.ttf')
    end

    describe 'override variables' do
      def change_variable(file, value, &block)
        content = File.read(file)

        File.write(file, content + "\n@blue: #{value};\n")
        block.call
      ensure
        File.write(file, content)
      end

      describe 'in theme.config' do
        let(:theme_config_file) { File.join(stylesheets_dir, 'semantic_ui', 'theme.config') }

        it 'should include changed variable' do
          change_variable theme_config_file, '#3b83c1' do
            expect(application_css).to.include?('#3b83c1')
          end
        end

        it 'should include changed cached variable' do
          change_variable theme_config_file, '#3b83c1' do
            expect(application_css).to.include?('#3b83c1')
          end

          change_variable theme_config_file, '#3b83c2' do
            expect(application_css).to.include?('#3b83c2')
          end
        end
      end

      describe 'in config/**/*.variables' do
        let(:theme_config_file) { File.join(stylesheets_dir, 'semantic_ui', 'config', 'globals', 'site.variables') }

        it 'should include changed variable' do
          change_variable theme_config_file, '#3b83c1' do
            expect(application_css).to.include?('#3b83c1')
          end
        end

        it 'should include changed cached variable' do
          change_variable theme_config_file, '#3b83c1' do
            expect(application_css).to.include?('#3b83c1')
          end

          change_variable theme_config_file, '#3b83c2' do
            expect(application_css).to.include?('#3b83c2')
          end
        end
      end
    end

    describe 'override 3 random themes' do
      def change_themes(file, theme, &block)
        content = File.read(file)

        File.write(file, content.gsub("'default'", "'#{theme}'"))
        block.call
      ensure
        File.write(file, content)
      end

      let(:theme_config_file) { File.join(stylesheets_dir, 'semantic_ui', 'theme.config') }

      Dir[File.expand_path('../../tmp/semantic-ui/src/themes/*', __dir__)].map { |d| File.basename(d) }.sample(3).each do |theme|
        describe "override `#{theme}` theme in theme.config" do
          it 'should not raise error' do
            change_themes(theme_config_file, theme) do
              expect(application_css).to.present?
            end
          end
        end
      end
    end
  end

  describe 'application.js' do
    let(:application_js) { dummy_assets['application.js'].to_s.strip }

    it 'should include semantic_ui.js' do
      expect(application_js).to.include?('$.site')
    end
  end
end