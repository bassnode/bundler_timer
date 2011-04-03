# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.version            = '1.0.0'
  s.date               = '2011-04-03'

  s.name               = 'bundler_timer'
  s.authors            = %w[bassnode]
  s.summary            = 'times bundler'
  s.description        = 'times bundler'

  s.default_executable = 'b'
  s.executables        = %w[b]
  s.files              = `git ls-files`.split

  s.add_dependency "sequel", '>= 0'
end