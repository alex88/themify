module Themify
  class Template
    attr_reader :colors
    attr_reader :name

    @colors = {}
    @name = nil

    # Creates a new template
    # Takes an hash as argument
    # { 'primary': '#ccffee' }
    def initialize(name, colors)
      raise 'You should pass an hash of key values for colors and a string as name' unless colors.instance_of?(Hash) && name.instance_of?(String)
      @name = name
      @colors = colors
    end
  end
end