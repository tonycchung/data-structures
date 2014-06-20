class BinaryTree
  attr_accessor :name, :left, :right

  def initialize(name, left = nil, right = nil)
    @name = name
    @left = left
    @right = right
    @@result = [] # Store results in an array and return them to check against minitest results.
  end

  def pre_order
    print @name + ' '
    @@result << @name
    @left.pre_order unless @left.nil?
    @right.pre_order unless @right.nil?
    return @@result
  end

  def in_order
    @left.in_order unless @left.nil?
    print @name + ' '
    @@result << @name
    @right.in_order unless @right.nil?
    return @@result
  end

  def post_order
    @left.post_order unless @left.nil?
    @right.post_order unless @right.nil?
    print @name + ' '
    @@result << @name
    return @@result
  end
end
