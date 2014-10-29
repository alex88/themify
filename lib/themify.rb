require 'themify/version'
require 'themify/template'
require 'themify/template_engine'
require 'themify/engine'

module Themify
  class << self
    attr_accessor :templates
  end
  @templates = []

  # Adds a template to an internal list of templates
  # Argument must be an instance of Themify::Template
  def self.add_template(template)
    raise 'Template should be an instance of Themify::Template' unless template.instance_of?(Themify::Template)
    self.templates ||= []
    self.templates << template
  end

  def self.generate_js
    'window.Themify = {}; window.Themify.templates = ' + templates.to_json
  end
end