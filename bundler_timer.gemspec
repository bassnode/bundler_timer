# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.version            = '1.0.2'
  s.name               = 'bundler_timer'
  s.authors            = %w[bassnode raggi]
  s.email              = 'bassnode@gmail.com'
  s.summary            = 'times bundler'
  s.description        = 'Keeps a log of your time waiting on bundler'
  s.homepage           = 'http://github.com/bassnode/bundler_timer'
  s.rubyforge_project  = 'https://rubygems.org/gems/bundler_timer'

  s.default_executable = 'b'
  s.executables        = %w[b]
  s.files              = `git ls-files`.split

  s.add_dependency "sequel", '~> 3'
  s.add_dependency "bundler", '~> 1'
end
