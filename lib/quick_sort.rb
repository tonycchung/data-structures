require 'pry'

def quick_sort(array, left = 0, right = array.size - 1)
  if left < right
    pivot_index = rand(left..right)
    new_pivot_index = partition(array, left, right, pivot_index)
    quick_sort(array, left, new_pivot_index - 1)
    quick_sort(array, new_pivot_index + 1, right)
  end
  return array
end

def partition(array, left, right, pivot_index)
  pivot_value = array[pivot_index]
  array[pivot_index], array[right] = array[right], array[pivot_index]
  store_index = left
  (left...right).each do |n|
    if array[n] < pivot_value
      array[n], array[store_index] = array[store_index], array[n]
      store_index += 1
    end
  end
  array[store_index], array[right] = array[right], array[store_index]
  return store_index
end
