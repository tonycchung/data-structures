require 'minitest/autorun'
require 'insertion_sort'

class TestInsertionSort < MiniTest::Test

  def setup
    @int_list = (0..100).map{rand(100)}
  end

  def test_insertion_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end
end
