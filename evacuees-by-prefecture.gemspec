# encoding: utf-8

require File.expand_path('../lib/evacuees/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'evacuees-by-prefecture'
  gem.description   = gem.summary = 'Extract evacuees by prefecture data from Recovery Agency PDF files'
  gem.version       = Evacuees::VERSION
  gem.authors       = ['Søren Jones']
  gem.email         = ['soren.jones@gmail.com']
  gem.homepage      = 'https://github.com/hhtyo/evacuees-by-prefecture'
  gem.license       = 'CC0'

  gem.platform      = 'java'

  gem.files         = `git ls-files | grep -Ev '^(data|test_data)'`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_dependency              'tabula-extractor'

  gem.add_development_dependency  'minitest'
  gem.add_development_dependency  'rake'
end
