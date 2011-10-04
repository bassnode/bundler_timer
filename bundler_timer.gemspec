# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require 'bundler_timer/version'

Gem::Specification.new do |s|
  s.version            = BundlerTimer::VERSION
  s.name               = 'bundler_timer'
  s.authors            = %w[bassnode raggi eptics]
  s.email              = 'bassnode@gmail.com'
  s.summary            = 'times bundler'
  s.description        = 'Keeps a log of your time waiting on bundler'
  s.homepage           = 'https://github.com/bassnode/bundler_timer'
  s.rubyforge_project  = 'bundler_timer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "sequel", '~> 3'
  s.add_dependency "bundler", '~> 1'
  s.add_dependency "sqlite3", '~> 1.3'
end
