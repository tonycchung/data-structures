require 'minitest/autorun'
require 'doubly_linked_list'

class TestDoublyLinkedLists < MiniTest::Test

  def setup
    @linked_list = DoublyLinkedList.new

    @linked_list.add('1')
    @linked_list.add('2')
    @linked_list.add('3')
  end

  def test_add_method
    assert_equal @linked_list.size, 3
  end

  def test_to_s_method
    assert_equal @linked_list.to_s, "1, 2, 3"
  end

  def test_deduplicate_with_array_method
    @linked_list = DoublyLinkedList.new

    @linked_list.add('1')
    @linked_list.add('1')
    @linked_list.add('2')
    @linked_list.add('2')
    @linked_list.add('3')
    @linked_list.add('3')

    assert_equal @linked_list.deduplicate_with_array.to_s, "1, 2, 3"
  end

  def test_deduplicate_slow_method
    @linked_list = DoublyLinkedList.new

    @linked_list.add('1')
    @linked_list.add('1')
    @linked_list.add('2')
    @linked_list.add('2')
    @linked_list.add('3')
    @linked_list.add('3')

    assert_equal @linked_list.deduplicate_slow.to_s, "1, 2, 3"
  end
end
