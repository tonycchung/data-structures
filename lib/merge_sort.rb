require 'benchmark'

def merge_sort(array)
  if array.length < 2
    return array
  else
    middle = array.length / 2
    left = array[0...middle]
    right = array[middle..-1]
    return merge_arrays(merge_sort(left), merge_sort(right))
  end
end

def merge_arrays(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  return result + left + right
end
