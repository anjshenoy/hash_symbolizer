# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hash_symbolizer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anjali Shenoy"]
  gem.email         = ["anjshenoy@gmail.com"]
  gem.description   = %q{Extends ActiveSupport's symbolize_keys to recursively symbolize keys at all levels in a Hash}
  gem.summary       = %q{Extends ActiveSupport's symbolize_keys to recursively symbolize all keys in a gem. By default, it is fully backwards compatible with ActiveSupport's symbolize_keys method. If the recursive flag is set to true however and it recursively symbolizes any values which are hashes.}
  gem.homepage      = "http://github.com/anjshenoy/hash_symbolizer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hash_symbolizer"
  gem.require_paths = ["lib"]
  gem.version       = HashSymbolizer::VERSION

  gem.add_dependency "rake"
  gem.add_dependency "activesupport"
end
