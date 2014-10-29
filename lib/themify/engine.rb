require 'active_support/ordered_options'
require 'rails'

module Themify
  class Railtie < Rails::Engine
    config.themify = ActiveSupport::OrderedOptions.new

    initializer 'sprockets.themify', after: 'sprockets.environment', group: :all do |app|
      next unless app.assets
      app.assets.register_engine('.template', Themify::TemplateEngine)
    end
  end
end