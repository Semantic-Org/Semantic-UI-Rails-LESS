require 'rails'

module Less
  module Rails
    module SemanticUI
      class Engine < ::Rails::Engine

        initializer 'less-rails-semantic_ui.assets.precompile' do |app|
          %w(stylesheets javascripts fonts images).each do |sub|
            app.config.assets.paths << root.join('assets', sub).to_s
          end
          app.config.assets.precompile << %r(semantic_ui/themes/.*\.(?:eot|svg|ttf|woff|woff2|png|gif)$)
        end

      end
    end
  end
end
