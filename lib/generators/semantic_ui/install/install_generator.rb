module SemanticUi
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('templates', __dir__)

    desc 'Install Semantic UI assets to application'

    def install_semantic_ui
      javascripts = File.join('vendor', 'assets', 'javascripts', 'semantic_ui')
      stylesheets = File.join('vendor', 'assets', 'stylesheets', 'semantic_ui')

      copy_file 'semantic_ui.js', File.join(javascripts, 'semantic_ui.js')
      copy_file 'semantic_ui.css', File.join(stylesheets, 'semantic_ui.css')

      copy_file 'theme.config', File.join(stylesheets, 'theme.config')
      directory 'config', File.join(stylesheets, 'config')
    end

  end
end
