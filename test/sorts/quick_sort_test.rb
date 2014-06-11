require 'minitest/autorun'
require 'quick_sort'
require 'benchmark'

class TestQuickSort < MiniTest::Test

  def setup
    @int_list = (0..100).map{rand(100)}
  end

  def test_quick_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end
end

def test_quick_sort_benchmark
  @rand_list = (0..10000).map{ rand(10000) }
  @sorted_list = @rand_list.sort
  @reverse_list = @rand_list.sort.reverse

  puts "Quick Sort Benchmarks"
  puts "Pre-sorted:"
  puts Benchmark.measure { quick_sort(@sorted_list) }

  puts "Reverse-sorted:"
  puts Benchmark.measure { quick_sort(@reverse_list) }

  puts "Randomly sorted:"
  puts Benchmark.measure { merge_sort(@rand_list) }
  puts
end

Minitest.after_run { test_quick_sort_benchmark }
