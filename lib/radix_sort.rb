def radix_sort(array)
  array_copy = array
  largest_val = 0

  # Find largest positive or negative number
  array.each do |n|
    if n.abs > largest_val
      largest_val = n
    end
  end

  # Number of passes is equal to number of sig figs in largest value
  number_of_passes = largest_val.abs.to_s.length
  number_of_passes.times do |i|
    buckets = []
    20.times do
      buckets << []
    end

    digit_check = 10**i
    array_copy.each do |n|
      bucket_digit = n / digit_check
      bucket_value = bucket_digit % 10
      bucket_value += 10 if n >= 0
      buckets[bucket_value] << n
    end
    array_copy = buckets.flatten
  end
  array_copy
end
