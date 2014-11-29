module SemanticUi
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('templates', __dir__)

    desc 'Install Semantic UI assets to application'

    cattr_reader :javascripts do
      File.join('vendor', 'assets', 'javascripts', 'semantic_ui')
    end

    cattr_reader :stylesheets do
      File.join('vendor', 'assets', 'stylesheets', 'semantic_ui')
    end

    def install_semantic_ui
      copy_file 'semantic_ui.js', File.join(javascripts, 'semantic_ui.js')
      copy_file 'semantic_ui.css', File.join(stylesheets, 'semantic_ui.css')

      copy_file 'theme.config', File.join(stylesheets, 'theme.config')
      directory 'config', File.join(stylesheets, 'config')
    end

  end
end
