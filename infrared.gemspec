# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infrared/version'

Gem::Specification.new do |spec|
  spec.name          = "infrared"
  spec.version       = Infrared::VERSION
  spec.authors       = ["Hank Beaver"]
  spec.email         = ["hbeaver@gmail.com"]
  spec.summary       = %q{Ghost blogging platform API gem.}
  spec.description   = %q{Ghost blogging platform API Gem for easy interface for migrations,etc.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
 
  # gem,runtime, need to version all gems
  spec.add_runtime_dependency 'activemodel'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'hashie'
  spec.add_runtime_dependency 'nokogiri'
  spec.add_runtime_dependency 'faraday-cookie_jar'

  # development
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'



end
