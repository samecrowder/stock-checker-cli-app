# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stock_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "stock_checker"
  spec.version       = StockChecker::VERSION
  spec.authors       = ["Sam Crowder"]
  spec.email         = ["samecrowder@gmail.com"]

  spec.summary       = %q{This Ruby CLI app gives the user a short list of today's hottest and coldest stocks on the New York Stock Exchange.}
  spec.homepage      = "https://github.com/samecrowder/stock-checker-cli-app"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
