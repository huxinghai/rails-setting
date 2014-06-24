# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails-setting/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["kaka"]
  gem.email         = ["huxinghai1988@qq.com"]
  gem.description   = %q{rails setting support multi database}
  gem.summary       = %q{rails setting support multi database}
  gem.homepage      = "https://github.com/huxinghai1988/rails-setting"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rails-setting"
  gem.require_paths = ["lib"]
  gem.version       = Rails::Setting::VERSION
  gem.add_dependency 'rails'
  gem.add_development_dependency "bundler", "~> 1.6"
  gem.add_development_dependency "rake"
end
