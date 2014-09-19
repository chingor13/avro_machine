# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avro_machine/version'

Gem::Specification.new do |spec|
  spec.name          = "avro_machine"
  spec.version       = AvroMachine::VERSION
  spec.authors       = ["Jeff Ching"]
  spec.email         = ["jching@avvo.com"]
  spec.summary       = %q{EventMachine server for Avro}
  spec.description   = %q{EventMachine server for Avro}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'avro', '~> 1.7.7'
  spec.add_dependency 'eventmachine', '~> 1.0.0'
  spec.add_dependency 'em-synchrony', '~> 1.0.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
