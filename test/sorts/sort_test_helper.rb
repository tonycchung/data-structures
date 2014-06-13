def make_rand_list
  @rand_list = (0..10000).map{ rand(-1000..1000) }
  @sorted_list = @rand_list.sort
  @reverse_list = @rand_list.sort.reverse
end
