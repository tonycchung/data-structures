require 'benchmark'

def insertion_sort(list)
  (1..list.length-1).each do |i|
    j = i
    while j > 0 && list[j-1] > list[j]
      current_holder = list[j]
      list[j] = list[j-1]
      list[j-1] = current_holder
      j -= 1
    end
  end
  return list
end

def benchmark_insertion_sort(list)
  puts Benchmark.measure { insertion_sort(list) }
end
