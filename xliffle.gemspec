# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'xliffle/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'xliffle'
  s.version     = Xliffle::VERSION
  s.authors     = ['Stefan Rohde']
  s.email       = ['info@rohdenetz.de']
  s.homepage    = 'https://github.com/sr189/xliffle'
  s.summary     = 'Gem to create XLIFF files'
  s.description = 'A gem to build XLIFF files from translated strings.'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.7', '< 4'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'builder', '~> 3.2'

  s.add_development_dependency 'oga', '~> 3.3'
  s.add_development_dependency 'pry', '~> 0.14'
  s.add_development_dependency 'rspec', '~> 3.10'
  s.add_development_dependency 'rubocop', '~> 1.15'
  s.add_development_dependency 'rubocop-rspec', '~> 2.3'
end
