# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml/exec/version'

Gem::Specification.new do |spec|
  spec.name          = "yaml-exec"
  spec.version       = Yaml::Exec::VERSION
  spec.authors       = ["Genki Takiuchi"]
  spec.email         = ["genki@s21g.com"]

  spec.summary       = %q{Execute command with args in a YAML file}
  spec.description   = <<-EOD
    You can execute command with very complicated arguments by using
    a YAML file.
  EOD
  spec.homepage      = "https://github.com/genki/yaml-exec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
