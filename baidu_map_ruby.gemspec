# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baidu_map_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "baidu_map_ruby"
  spec.version       = BaiduMapRuby::VERSION
  spec.authors       = ["gxw"]
  spec.email         = ["alphaguoxiongwei@gmail.com"]
  spec.summary       = %q{baidu map plugin}
  spec.description   = %q{baidu map plugin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
