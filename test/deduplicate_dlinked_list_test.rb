require 'minitest/autorun'
require 'doubly_linked_list'

class TestDoublyLinkedLists < MiniTest::Test

  def setup
    @linked_list = DoublyLinkedList.new
    200.times do
      @linked_list.add(Node.new(rand(100)))
    end
  end

  def test_add_method
    assert_equal @linked_list.size, 200
  end

  def test_remove_method
    test_node = Node.new(1)
    @linked_list.add(test_node)
    assert_equal @linked_list.size, 201

    @linked_list.remove(test_node)
    assert_equal @linked_list.size, 200
  end

  def to_s_method
    @linked_list = DoublyLinkedList.new
    @node1 = Node.new 'first node'
    @node2 = Node.new 'second node'
    @node3 = Node.new 'third node'

    @linked_list.add(@node1)
    @linked_list.add(@node2)
    @linked_list.add(@node3)

    assert_equal @linked_list.to_s, "first node, second node, third node"
  end

  def test_deduplicate_method
    @node1 = Node.new '1'
    @node2 = Node.new '2'
    @node3 = Node.new '3'

    @linked_list.add(@node1)
    @linked_list.add(@node1)
    @linked_list.add(@node2)
    @linked_list.add(@node2)
    @linked_list.add(@node2)
    @linked_list.add(@node3)
    @linked_list.add(@node3)

    assert_equal @linked_list.deduplicate, "1, 2, 3"
  end
end
