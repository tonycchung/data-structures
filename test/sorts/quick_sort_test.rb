require 'minitest/autorun'
require 'quick_sort'
require 'benchmark'
require_relative 'sort_test_helper'

class TestQuickSort < MiniTest::Test

  def setup
    @int_list = (0..100).map{rand(100)}
  end

  def test_quick_sort_method
    assert_equal insertion_sort(@int_list), @int_list.sort
  end
end

def test_quick_sort_benchmark

  make_rand_list

  puts "Quick Sort Benchmarks"
  puts "Pre-sorted:"
  puts Benchmark.measure { quick_sort(@sorted_list) }

  puts "Reverse-sorted:"
  puts Benchmark.measure { quick_sort(@reverse_list) }

  puts "Randomly sorted:"
  puts Benchmark.measure { quick_sort(@rand_list) }
  puts
end

Minitest.after_run { test_quick_sort_benchmark }
