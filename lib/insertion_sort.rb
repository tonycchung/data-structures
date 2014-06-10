require 'benchmark'

def insertion_sort(array)
  (1...array.length).each do |i|
    j = i
    while j > 0 && array[j-1] > array[j]
      current_holder = array[j]
      array[j] = array[j-1]
      array[j-1] = current_holder
      j -= 1
    end
  end
  return array
end

def benchmark_insertion_sort(array)
  puts Benchmark.measure { insertion_sort(array) }
end
