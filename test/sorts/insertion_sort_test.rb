require 'minitest/autorun'
require 'insertion_sort'
require 'benchmark'

class TestInsertionSort < MiniTest::Test

  def setup
    @int_list = (0..100).map{rand(100)}
  end

  def test_insertion_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end
end

def test_insertion_sort_benchmark
  @rand_list = (0..1000).map{ rand(1000) }
  @sorted_list = @rand_list.sort
  @reverse_list = @rand_list.sort.reverse

  puts "Insertion Sort Benchmarks"
  puts "Pre-sorted:"
  puts Benchmark.measure { insertion_sort(@sorted_list) }

  puts "Reverse-sorted:"
  puts Benchmark.measure { insertion_sort(@reverse_list) }

  puts "Randomly sorted:"
  puts Benchmark.measure { merge_sort(@rand_list) }
  puts
end

Minitest.after_run { test_insertion_sort_benchmark }
