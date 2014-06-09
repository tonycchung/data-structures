require 'minitest/autorun'
require 'insertion_sort'
require 'benchmark'

class TestInsertionSort < MiniTest::Test

  def setup
    @int_list = (0..10000).map{rand(10000)}
    @sorted_list = @int_list.sort
    @reverse_list = @int_list.sort.reverse
  end

  def test_insertion_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end

  def test_benchmark
    puts "Best-case scenario - already sorted list"
    benchmark_insertion_sort(@sorted_list)

    puts "Worst-case scenario - reverse sorted list"
    benchmark_insertion_sort(@reverse_list)
  end
end
