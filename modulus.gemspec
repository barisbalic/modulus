# -*- encoding: utf-8 -*-
require File.expand_path('../lib/modulus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Baris Balic"]
  gem.email         = ["baris.balic@forward.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "modulus"
  gem.require_paths = ["lib"]
  gem.version       = Modulus::VERSION

  gem.add_dependency 'redis'
end
