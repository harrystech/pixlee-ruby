# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pixlee/version'

Gem::Specification.new do |spec|
  spec.name          = "pixlee"
  spec.version       = Pixlee::VERSION
  spec.authors       = ["Daniel Schwartz"]
  spec.email         = ["dschwartz88@gmail.com"]
  spec.description   = ["A simple wrapper for accessing the Pixlee API"]
  spec.summary       = ["A simple wrapper for accessing the Pixlee API"]
  spec.homepage      = "http://github.com/harrystech/pixlee-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
