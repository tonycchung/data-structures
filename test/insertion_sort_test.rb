require 'minitest/autorun'
require 'insertion_sort'
require 'benchmark'

class TestInsertionSort < MiniTest::Test

  def setup
    @int_list = (0..1000).map{rand(1000)}
  end

  def test_insertion_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end
end

def test_benchmark
  @int_list = (0..1000).map{ rand(1000) }
  @sorted_list = @int_list.sort
  @reverse_list = @int_list.sort.reverse

  puts "Best-case scenario - already sorted list"
  benchmark_insertion_sort(@sorted_list)

  puts "Worst-case scenario - reverse sorted list"
  benchmark_insertion_sort(@reverse_list)
end

Minitest.after_run { test_benchmark }
