require 'themify'

RSpec.configure do |config|
  config.before(:each) {
    Themify.instance_variable_set :@templates, []
  }
end