# HashSymbolizer

Extends ActiveSupport's symbolize_keys to recursively symbolize all keys in a gem. By default, it is fully backwards compatible with ActiveSupport's symbolize_keys method. If the recursive flag is set to true however and it recursively symbolizes any values which are hashes.

## Installation

Add this line to your application's Gemfile:

    gem 'hash_symbolizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_symbolizer

## Usage

gem install hash_symbolizer 
or
include it in your Gemfile and then run bundle install.

Examples:
```ruby
{"a" => {"b" => 1}}.symbolize_keys = {:a => {"b" => 1}}

{"a" => {"b" => 1}}.symbolize_keys(true) = {:a => {:b => 1}}

{"a" => {"b" => 1}}.symbolize_keys! = {:a => {"b" => 1}}

{"a" => {"b" => 1}}.symbolize_keys!(true) = {:a => {:b => 1}}
```

Works on Ruby 1.9.2-p290, 1.9.3-p125, ActiveSupport version 3.2.2 as of now.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
