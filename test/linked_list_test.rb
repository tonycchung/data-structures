require 'minitest/autorun'
require 'linked_list'

class TestLinkedLists < MiniTest::Unit::TestCase

  def setup
    # Create some nodes
    @node1 = Node.new 'first node'
    @node2 = Node.new 'second node'
    @node3 = Node.new 'third node'
    @node_symbol = Node.new :node_symbol
    @node_int = Node.new 5
  end

  def test_insert_method
    @linked_list = LinkedList.new
    # Check linked list is empty
    assert_equal @linked_list.size, 0

    # Check if node is inserted into linked list
    @linked_list.insert(@node1)
    assert_equal @linked_list.size, 1
    assert_equal @linked_list.search(@node1.node_id), @node1

    @linked_list.insert(@node2)
    assert_equal @linked_list.size, 2
    assert_equal @linked_list.search(@node2.node_id), @node2
  end

  def test_size_method
    @linked_list = LinkedList.new
    # Empty linked list
    assert_equal @linked_list.size, 0

    # Single node in linked list
    @linked_list.insert(@node1)
    assert_equal @linked_list.size, 1

    # Two nodes in linked list
    @linked_list.insert(@node2)
    assert_equal @linked_list.size, 2
  end

  def test_remove_method
    @linked_list = LinkedList.new

    # Insert some nodes, check linked list
    @linked_list.insert(@node1)
    @linked_list.insert(@node2)
    @linked_list.insert(@node3)
    assert_equal @linked_list.size, 3
    assert_equal @linked_list.search(@node2.node_id), @node2

    # Check if removed node is no longer in linked list
    @linked_list.remove(@node2)
    assert_equal @linked_list.size, 2
    assert_equal @linked_list.search(@node2.node_id), nil
  end

  def test_search_method
    @linked_list = LinkedList.new

    # Search empty linked list
    assert_equal @linked_list.search(@node1.node_id), nil

    # Search linked list for @node1
    @linked_list.insert(@node1)
    @linked_list.insert(@node2)
    assert_equal @linked_list.search(@node1.node_id), @node1

    # Search linked list for @node2
    assert_equal @linked_list.search(@node2.node_id), @node2
  end

  def test_to_s_method
    @linked_list = LinkedList.new

    # Insert some nodes
    @linked_list.insert(@node1)
    @linked_list.insert(@node2)
    @linked_list.insert(@node3)
    @linked_list.insert(@node_symbol)
    @linked_list.insert(@node_int)

    assert_equal @linked_list.to_s, "first node, second node, third node, node_symbol, 5"
  end
end
