# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sefazp/version'

Gem::Specification.new do |spec|
  spec.name          = "sefazp"
  spec.version       = Sefazp::VERSION
  spec.authors       = ["Alexei Telles"]
  spec.email         = ["alexeitsb@gmail.com"]
  spec.summary       = "Transforma seus arquivos xml de MDFe, CTe e NFe em um Hash contendo as informações mais importantes"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
