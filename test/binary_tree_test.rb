require 'minitest/autorun'
require 'binary_tree'

class TestBinaryTree < MiniTest::Test

  def setup
    @tree8 = BinaryTree.new('8')
    @tree7 = BinaryTree.new('7')
    @tree6 = BinaryTree.new('6',)
    @tree5 = BinaryTree.new('5', @tree7)
    @tree4 = BinaryTree.new('4', @tree6)
    @tree3 = BinaryTree.new('3', @tree8)
    @tree2 = BinaryTree.new('2', @tree4, @tree5)
    @tree1 = BinaryTree.new('1', @tree2, @tree3)
  end

  def test_pre_order_method
    result = @tree1.pre_order
    assert_equal result,['1', '2', '4', '6', '5', '7', '3', '8']
  end

  def test_in_order_method
    result = @tree1.in_order
    assert_equal result,['6', '4', '2', '7', '5', '1', '8', '3']
  end

  def test_post_order_method
    result = @tree1.post_order
    assert_equal result,['6', '4', '7', '5', '2', '8', '3', '1']
  end
end
