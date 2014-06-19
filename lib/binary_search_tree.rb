class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = NullBST.new(self)
    @right = NullBST.new(self)
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
end
