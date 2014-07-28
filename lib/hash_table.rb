class HashTable
  attr_accessor :buckets

  def initialize(size)
    @size = size
    @buckets = []
    size.times do
      @buckets << []
    end
  end

  def get(key)
    address = hash_function(key)
    val = nil
    @buckets[address].each do |bucket|
      val = bucket[1] if bucket[0] == key
    end
    return val
  end

  def set(key, val)
    raise "Key must be a string" unless key.is_a?(String)
    address = hash_function(key)
    @buckets[address] << [key, val]
  end

  def hash_function(key)
    hash = 0
    key.each_char do |char|
      hash += char.ord
    end
    return hash % @size
  end
end

