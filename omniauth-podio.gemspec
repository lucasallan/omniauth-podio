# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-podio/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-podio"
  s.version     = Omniauth::Podio::VERSION
  s.authors     = ["Lucas Allan"]
  s.email       = ["lucas.allan@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{OmniAuth strategy for Podio.}
  s.description = %q{OmniAuth strategy for Podio.}

  s.rubyforge_project = "omniauth-podio"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
