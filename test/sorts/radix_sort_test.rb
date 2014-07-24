require 'minitest/autorun'
require 'radix_sort'
require 'benchmark'
require_relative 'sort_test_helper'

class TestRadixSort < MiniTest::Test

  def setup
    @int_list = (0..100).map{rand(-1000..1000)}
  end

  def test_radix_sort_method
    assert_equal radix_sort(@int_list), @int_list.sort
  end
end

def test_radix_sort_benchmark

  make_rand_list

  puts "Radix Sort Benchmarks"
  puts "Pre-sorted:"
  puts Benchmark.measure { radix_sort(@sorted_list) }

  puts "Reverse-sorted:"
  puts Benchmark.measure { radix_sort(@reverse_list) }

  puts "Randomly sorted:"
  puts Benchmark.measure { radix_sort(@rand_list) }
  puts
end

Minitest.after_run { test_radix_sort_benchmark }
