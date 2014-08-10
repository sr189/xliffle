$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "xliffle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "xliffle"
  s.version     = Xliffle::VERSION
  s.authors     = ["Stefan Rohde"]
  s.email       = ["info@rohdenetz.de"]
  s.homepage    = "https://github.com/sr189/xliffle"
  s.summary     = "Gem to create XLIFF files"
  s.description = "A gem to build XLIFF files from translated strings."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "builder"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
