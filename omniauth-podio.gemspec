# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-podio/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Lucas Allan", "Joel Van Horn"]
  gem.email         = ["lucas.allan@gmail.com", "joel@joelvanhorn.com"]
  gem.description   = %q{OmniAuth strategy for Podio.}
  gem.summary       = %q{OmniAuth strategy for Podio.}
  gem.homepage      = "https://github.com/lucasallan/omniauth-podio"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-podio"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Podio::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end