# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'starbucksstats/version'

Gem::Specification.new do |spec|
  spec.name          = "starbucksstats"
  spec.version       = Starbucksstats::VERSION
  spec.authors       = ["RSid"]
  spec.email         = ["sm1th303@gmail.com"]
  spec.summary       = "Scrapes Starbucks' website for nutritional information."
  spec.description   = "Starbucksstats does what it says on the tin; it scrapes
  Starbuck's website for nutritional information and allows users to call specific
   information about various foods and drinks."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client', '~>1.7', '>=1.7.2'
  spec.add_dependency 'nokogiri', '~>1.6', '>=1.6.5'
  spec.add_dependency 'pdf-reader', '~>1.3', '>=1.3.3'

  spec.add_development_dependency 'pry', '~>0.10','>=0.10.1'
  spec.add_development_dependency 'rspec', '~>3.1','>=3.1.0'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
