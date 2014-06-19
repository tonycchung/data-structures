require 'minitest/autorun'
require 'binary_search_tree'

class TestBinarySearchTree < MiniTest::Test

  def setup
    @tree2 = BinarySearchTree.new(2)
  end

  def test_insert_method
    @tree2.insert(1)
    @tree2.insert(3)
    assert_equal @tree2.value, 2
    assert_equal @tree2.left.value, 1
    assert_equal @tree2.right.value, 3
  end

  def test_contains_method
    @tree2.insert(1)
    @tree2.insert(3)
    assert_equal @tree2.contains(1), true
    assert_equal @tree2.contains(3), true
    assert_equal @tree2.contains(5), false
  end

  def test_size_method
    assert_equal @tree2.size, 1

    @tree2.insert(1)
    assert_equal @tree2.size, 2

    @tree2.insert(3)
    assert_equal @tree2.size, 3
  end

  def test_depth_method
    @tree2.insert(1)
    @tree2.insert(3)
    @tree2.insert(4)
    @tree2.insert(5)
    assert_equal @tree2.depth, 4
  end

  def test_balance_method
    assert_equal @tree2.balance, 0

    @tree2.insert(1)
    assert_equal @tree2.balance, 1

    @tree2.insert(4)
    @tree2.insert(5)
    assert_equal @tree2.balance, -1
  end
end

def test_worst_case_contains

end

Minitest.after_run { test_worst_case_contains }
