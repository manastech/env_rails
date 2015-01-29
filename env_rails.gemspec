# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'env_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "env_rails"
  spec.version       = EnvRails::VERSION
  spec.authors       = ["Juan Wajnerman"]
  spec.email         = ["jwajnerman@manas.com.ar"]
  spec.summary       = %q{Set Rails configuration parameters using environment variables}
  spec.homepage      = "https://github.com/manastech/env_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
