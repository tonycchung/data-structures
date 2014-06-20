require 'minitest/autorun'
require 'binary_search_tree'

class TestBinarySearchTree < MiniTest::Test

  def setup
    @tree1 = BinarySearchTree.new(2)

    @tree2 = BinarySearchTree.new(8)
    @tree2.insert(4)
    @tree2.insert(12)
    @tree2.insert(2)
    @tree2.insert(6)
    @tree2.insert(10)
    @tree2.insert(15)
  end

  def test_insert_method
    @tree1.insert(1)
    @tree1.insert(3)
    assert_equal @tree1.value, 2
    assert_equal @tree1.left.value, 1
    assert_equal @tree1.right.value, 3
  end

  def test_contains_method
    @tree1.insert(1)
    @tree1.insert(3)
    assert_equal @tree1.contains(1), true
    assert_equal @tree1.contains(3), true
    assert_equal @tree1.contains(5), false
  end

  def test_size_method
    assert_equal @tree1.size, 1

    @tree1.insert(1)
    assert_equal @tree1.size, 2

    @tree1.insert(3)
    assert_equal @tree1.size, 3
  end

  def test_depth_method
    @tree1.insert(1)
    @tree1.insert(3)
    @tree1.insert(4)
    @tree1.insert(5)
    assert_equal @tree1.depth, 4
  end

  def test_balance_method
    assert_equal @tree1.balance, 0

    @tree1.insert(1)
    assert_equal @tree1.balance, 1

    @tree1.insert(4)
    @tree1.insert(5)
    assert_equal @tree1.balance, -1
  end

  def test_pre_order_method
    result = @tree2.pre_order
    assert_equal result,[8, 4, 2, 6, 12, 10, 15]
  end

  def test_in_order_method
    result = @tree2.in_order
    assert_equal result,[2, 4, 6, 8, 10, 12, 15]
  end

  def test_post_order_method
    result = @tree2.post_order
    assert_equal result,[2, 6, 4, 10, 15, 12, 8]
  end

  def test_breadth_first_order_method
    result = @tree2.breadth_first_order
    assert_equal result,[8, 4, 12, 2, 6, 10, 15]
  end
end
