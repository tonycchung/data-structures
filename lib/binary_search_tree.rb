class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = NullBST.new(self)
    @right = NullBST.new(self)
    @@result = [] # Store results in an array and return them to check against minitest results.
  end

  def insert(val)
    if val < @value
      @left.insert(val)
    elsif val > @value
      @right.insert(val)
    else
      raise 'Value already exists in tree'
    end
  end

  def contains(val)
    if val < @value
      @left.contains(val)
    elsif val > @value
      @right.contains(val)
    else
      true
    end
  end

  def size
    1 + @left.size + @right.size
  end

  def depth
    1 + [@left.depth, @right.depth].max
  end

  def balance
    @left.depth - @right.depth
  end

  def pre_order
    # print @value + ' '
    @@result << @value
    @left.pre_order unless @left.nil?
    @right.pre_order unless @right.nil?
    return @@result
  end

  def in_order
    @left.in_order unless @left.nil?
    # print @value + ' '
    @@result << @value
    @right.in_order unless @right.nil?
    return @@result
  end

  def post_order
    @left.post_order unless @left.nil?
    @right.post_order unless @right.nil?
    # print @value + ' '
    @@result << @value
    return @@result
  end

  def breadth_first_order
    queue = [self]
    result = []
    until queue.empty?
      node = queue.shift
      unless node.is_a?(NullBST)
        result << node.value
        queue << node.left
        queue << node.right
      end
    end
    result
  end
end

class NullBST
  attr_reader :parent

  def initialize(parent)
    @parent = parent
  end

  def insert(value)
    if value < @parent.value
      @parent.left = BinarySearchTree.new(value)
    else
      @parent.right = BinarySearchTree.new(value)
    end
  end

  def contains(value)
    false
  end

  def size
    0
  end

  def depth
    0
  end

  def pre_order
    nil
  end

  def in_order
    nil
  end

  def post_order
    nil
  end

  def breadth_first_order
    nil
  end
end
