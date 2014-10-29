# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'themify/version'

Gem::Specification.new do |spec|
  spec.name          = 'themify'
  spec.version       = Themify::VERSION
  spec.authors       = ['Alessandro Tagliapietra']
  spec.email         = ['tagliapietra.alessandro@gmail.com']
  spec.summary       = %q{Manage themes that can be used in SASS and JS files}
  spec.description   = %q{With themify you can handle multiple themes and generate css and js files}
  spec.homepage      = 'https://github.com/alex88/themify'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sass'
  spec.add_dependency 'rails', '>= 3.1.0'

  spec.add_development_dependency 'bundler', '>= 1.3.0', '< 2.0'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec'
end
