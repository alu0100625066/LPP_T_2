# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Exam/version'

Gem::Specification.new do |spec|
<<<<<<< HEAD
  spec.name          = "Question"
  spec.version       = Question::VERSION
  spec.authors       = ["Simón Fuertes", "Nuria Gonzalo"]
  spec.email         = ["alu0100625066@edu.ull.es", "alu0100598155@edu.ull.es"]
=======
  spec.name          = "Exam"
  spec.version       = Exam::VERSION
  spec.authors       = ["Simón Fuertes", "Nuria Gonzalo"]
  spec.email         = ["alu0100625066@edu.ull.com", "alu0100@edu.ull.com"]
>>>>>>> Reestructurada la práctica anterior para su reutilización
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
