require 'minitest/autorun'
require 'queue'

class TestQueue < MiniTest::Test

  def setup
    # Create some items for the queue
    @item1 = QueueItem.new('item1')
    @item2 = QueueItem.new('item2')
    @item3 = QueueItem.new('item3')
    @item4 = QueueItem.new('item4')
  end

  def test_enenqueue_method
    @queue = Queue.new
    # Enqueue some items and see that the queue grows
    @queue.enqueue(@item1)
    assert_equal @queue.size, 1

    @queue.enqueue(@item2)
    assert_equal @queue.size, 2
  end

  def test_dequeue_method
    @queue = Queue.new

    # Test dequeue-ing an empty queue
    assert_raises RuntimeError do
      @queue.dequeue
    end

    # Enqueue some items and make sure they dequeue as LIFO
    @queue.enqueue(@item1)
    @queue.enqueue(@item2)
    @queue.enqueue(@item3)

    result = @queue.dequeue
    assert_equal result, 'item1'
    assert_equal @queue.size, 2

    result = @queue.dequeue
    assert_equal result, 'item2'
    assert_equal @queue.size, 1

    result = @queue.dequeue
    assert_equal result, 'item3'
    assert_equal @queue.size, 0
  end

  def test_size_method
    @queue = Queue.new

    # Test empty queue
    assert_equal @queue.size, 0

    @queue.enqueue(@item1)
    assert_equal @queue.size, 1

    @queue.enqueue(@item2)
    assert_equal @queue.size, 2

    @queue.enqueue(@item3)
    assert_equal @queue.size, 3
  end
end
