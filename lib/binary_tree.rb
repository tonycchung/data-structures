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

# Simple test
# tree8 = BinaryTree.new('8')
# tree7 = BinaryTree.new('7')
# tree6 = BinaryTree.new('6',)
# tree5 = BinaryTree.new('5', tree7)
# tree4 = BinaryTree.new('4', tree6)
# tree3 = BinaryTree.new('3', tree8)
# tree2 = BinaryTree.new('2', tree4, tree5)
# tree1 = BinaryTree.new('1', tree2, tree3)

# puts 'Expected: 1 2 4 6 5 7 3 8'
# print 'Actual  : '
# tree1.pre_order
# puts

# puts 'Expected: 6 4 2 7 5 1 8 3'
# print 'Actual  : '
# tree1.in_order
# puts

# puts 'Expected: 6 4 7 5 2 8 3 1'
# print 'Actual  : '
# tree1.post_order
# puts
