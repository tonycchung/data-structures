require 'minitest/autorun'
require 'hash_table'

class TestHashTable < MiniTest::Test

  def setup
    @hash_table = HashTable.new(20)
  end

  def test_hash_table_small
    @hash_table.set("a", 1)
    @hash_table.set("b", 2)
    @hash_table.set("c", 3)
    @hash_table.set("d", 4)
    @hash_table.set("e", 5)

    assert_equal @hash_table.get("a"), 1
    assert_equal @hash_table.get("b"), 2
    assert_equal @hash_table.get("c"), 3
    assert_equal @hash_table.get("d"), 4
    assert_equal @hash_table.get("e"), 5
  end

  # def test_hash_table_large
  #   @large_hash_table = HashTable.new(100000)
  #   @file = File.open("/usr/share/dict/words")
  #   @file.each_line do |word|
  #     @large_hash_table.set(word, word.reverse)
  #     assert_equal @large_hash_table.get(word), word.reverse
  #   end
  # end
end
