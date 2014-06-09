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

# list = [2, 4, 3, 8, 6, 7, 5, 1]
# insertion_sort(list)
