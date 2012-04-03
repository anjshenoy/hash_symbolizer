require File.expand_path("#{File.dirname(__FILE__)}/../../../lib/hash_symbolizer")
require 'test/unit'

class HashExtTest < Test::Unit::TestCase
  def setup
    @strings = { 'a' => 1, 'b' => 2 }
    @symbols = { :a  => 1, :b  => 2 }
    @mixed   = { :a  => 1, 'b' => 2 }
    @fixnums = {  0  => 1,  1  => 2 }
    @illegal_symbols = { [] => 3 }
    @nested_hash = { 'a' => {'b' => 2} }
    @nested_hash_first_level_symbolized = { :a => { 'b' => 2 } }
    @nested_hash_all_keys_symbolized = { :a => { :b => 2 } }
  end

  def test_methods
    h = {}
    assert_respond_to h, :symbolize_keys
    assert_respond_to h, :symbolize_keys!
    assert_respond_to h, :to_options
    assert_respond_to h, :to_options!
  end

  def test_symbolize_keys
    assert_equal @symbols, @symbols.symbolize_keys
    assert_equal @symbols, @strings.symbolize_keys
    assert_equal @symbols, @mixed.symbolize_keys
    assert_equal @nested_hash_first_level_symbolized, @nested_hash.symbolize_keys
  end

  def test_symbolize_keys_with_recursive_option
    assert_equal @symbols, @symbols.symbolize_keys(true)
    assert_equal @symbols, @strings.symbolize_keys(true)
    assert_equal @symbols, @mixed.symbolize_keys(true)
    assert_equal @nested_hash_all_keys_symbolized, @nested_hash.symbolize_keys(true)
  end

  def test_symbolize_keys!
    assert_equal @symbols, @symbols.dup.symbolize_keys!
    assert_equal @symbols, @strings.dup.symbolize_keys!
    assert_equal @symbols, @mixed.dup.symbolize_keys!
    assert_equal @nested_hash_first_level_symbolized, @nested_hash.symbolize_keys!
  end

  def test_symbolize_keys_bang_with_recursive_option
    assert_equal @symbols, @symbols.dup.symbolize_keys!(true)
    assert_equal @symbols, @strings.dup.symbolize_keys!(true)
    assert_equal @symbols, @mixed.dup.symbolize_keys!(true)
    assert_equal @nested_hash_all_keys_symbolized, @nested_hash.symbolize_keys!(true)
  end

  def test_symbolize_keys_preserves_keys_that_cant_be_symbolized
    assert_equal @illegal_symbols, @illegal_symbols.symbolize_keys
    assert_equal @illegal_symbols, @illegal_symbols.dup.symbolize_keys!
  end

  def test_symbolize_keys_with_recursive_option_preserves_keys_that_cant_be_symbolized
    assert_equal @illegal_symbols, @illegal_symbols.symbolize_keys(true)
    assert_equal @illegal_symbols, @illegal_symbols.dup.symbolize_keys!(true)
  end

  def test_symbolize_keys_preserves_fixnum_keys
    assert_equal @fixnums, @fixnums.symbolize_keys
    assert_equal @fixnums, @fixnums.dup.symbolize_keys!
  end

  def test_symbolize_keys_with_recursive_option_preserves_fixnum_keys
    assert_equal @fixnums, @fixnums.symbolize_keys(true)
    assert_equal @fixnums, @fixnums.dup.symbolize_keys!(true)
  end

  def test_symbolize_keys_for_hash_with_indifferent_access
    assert_instance_of Hash, @symbols.with_indifferent_access.symbolize_keys
    assert_equal @symbols, @symbols.with_indifferent_access.symbolize_keys
    assert_equal @symbols, @strings.with_indifferent_access.symbolize_keys
    assert_equal @symbols, @mixed.with_indifferent_access.symbolize_keys
  end

  def test_symbolize_keys_with_recursive_option_for_hash_with_indifferent_access
    assert_instance_of Hash, @symbols.with_indifferent_access.symbolize_keys(true)
    assert_equal @symbols, @symbols.with_indifferent_access.symbolize_keys(true)
    assert_equal @symbols, @strings.with_indifferent_access.symbolize_keys(true)
    assert_equal @symbols, @mixed.with_indifferent_access.symbolize_keys(true)
    assert_equal @nested_hash_all_keys_symbolized, @nested_hash.symbolize_keys(true)
  end

  def test_symbolize_keys_bang_for_hash_with_indifferent_access
    assert_raise(NoMethodError) { @symbols.with_indifferent_access.dup.symbolize_keys! }
    assert_raise(NoMethodError) { @strings.with_indifferent_access.dup.symbolize_keys! }
    assert_raise(NoMethodError) { @mixed.with_indifferent_access.dup.symbolize_keys! }
    assert_raise(NoMethodError) { @nested_hash.with_indifferent_access.dup.symbolize_keys! }
  end

  def test_symbolize_keys_bang_with_recursive_option_for_hash_with_indifferent_access
    assert_raise(NoMethodError) { @symbols.with_indifferent_access.dup.symbolize_keys!(true) }
    assert_raise(NoMethodError) { @strings.with_indifferent_access.dup.symbolize_keys!(true)  }
    assert_raise(NoMethodError) { @mixed.with_indifferent_access.dup.symbolize_keys!(true) }
    assert_raise(NoMethodError) { @nested_hash.with_indifferent_access.dup.symbolize_keys!(true) }
  end

  def test_symbolize_keys_preserves_keys_that_cant_be_symbolized_for_hash_with_indifferent_access
    assert_equal @illegal_symbols, @illegal_symbols.with_indifferent_access.symbolize_keys
    assert_raise(NoMethodError) { @illegal_symbols.with_indifferent_access.dup.symbolize_keys! }
  end

  def test_symbolize_keys_with_recursive_option_preserves_keys_that_cant_be_symbolized_for_hash_with_indifferent_access
    assert_equal @illegal_symbols, @illegal_symbols.with_indifferent_access.symbolize_keys(true)
    assert_raise(NoMethodError) { @illegal_symbols.with_indifferent_access.dup.symbolize_keys!(true) }
  end

  def test_symbolize_keys_preserves_fixnum_keys_for_hash_with_indifferent_access
    assert_equal @fixnums, @fixnums.with_indifferent_access.symbolize_keys
    assert_raise(NoMethodError) { @fixnums.with_indifferent_access.dup.symbolize_keys! }
  end

  def test_symbolize_keys_with_recursive_option_preserves_fixnum_keys_for_hash_with_indifferent_access
    assert_equal @fixnums, @fixnums.with_indifferent_access.symbolize_keys(true)
    assert_raise(NoMethodError) { @fixnums.with_indifferent_access.dup.symbolize_keys!(true) }
  end


end

