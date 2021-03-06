# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli/version'

Gem::Specification.new do |spec|
  spec.name          = "dainty"
  spec.version       = Cli::VERSION
  spec.authors       = ["od3n"]
  spec.email         = ["mr.od3n@gmail.com"]
  spec.summary       = %q{Dainty::Cli allows you to store and manipulate bookmarks using a command-line interface.}
  spec.description   = %q{Dainty::Cli allows you to store and manipulate bookmarks using a command-line interface.}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "yard"

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "log4r"
  spec.add_runtime_dependency "httparty"
end
