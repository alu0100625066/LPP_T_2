# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Exam/version'

Gem::Specification.new do |spec|
  spec.name          = "Exam"
  spec.version       = Exam::VERSION
  spec.authors       = ["Simón Fuertes", "Nuria Gonzalo"]
  spec.email         = ["alu0100625066@edu.ull.com", "alu0100598155@edu.ull.com"]
  spec.summary       = %q{Gema de realizacion de examenes tipo test}
  spec.description   = %q{Gema de realizacion de examenes tipo test}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "lib/Exam"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
  spec.add_development_dependency "guard"
	spec.add_development_dependency "guard-rspec"
	spec.add_development_dependency "guard-bundler"
	spec.add_development_dependency "coveralls"
end
