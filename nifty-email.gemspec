# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nifty-email/version'

Gem::Specification.new do |spec|
  spec.name          = "nifty-email"
  spec.version       = Nifty::Email::VERSION
  spec.authors       = ["Scott Albertson"]
  spec.email         = ["scott@thoughtbot.com"]
  spec.summary       = %q{Client for Nifty Email service}
  spec.description   = %q{Nify Email can be used to manage email content outside of your application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "faraday"
end
