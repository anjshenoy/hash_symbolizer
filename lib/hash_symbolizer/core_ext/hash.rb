class Hash
  # Return a new hash with all keys converted to symbols, as long as
  # they respond to +to_sym+.
  # If recursive is set to true, then keys at all levels will be symbolized.
  def symbolize_keys(recursive = false)
    dup.symbolize_keys!(recursive)
  end

  # Destructively convert all keys to symbols, as long as they respond
  # to +to_sym+.
  # If recursive is set to true, then keys at all levels will be symbolized.
  def symbolize_keys!(recursive = false)
    keys.each do |key|
      value = delete(key)
      key = key.respond_to?(:to_sym) ? key.to_sym : key
      self[key] = (recursive && value.is_a?(Hash)) ? value.dup.symbolize_keys!(recursive) : value
    end
    self
  end
end
