class HashWithIndifferentAccess < Hash

  undef :symbolize_keys
  # If recursive is set to true, keys at all levels will be symbolized
  def symbolize_keys(recursive = false)
    to_hash.symbolize_keys(recursive)
  end
end
