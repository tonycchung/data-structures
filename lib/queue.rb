class Queue
  attr_accessor :first, :last, :size

  def initialize
    @first = nil
    @last = nil
    @size = 0
  end

  def enqueue(item)
    if @first == nil
      @first = item
      @last = item
    else
      @last.prev_item = item
      @last = item
    end
    @size += 1
  end

  def dequeue
    if @first == nil
      raise 'Queue is empty'
    else
      result = @first.id
      @first = @first.prev_item
      @size -= 1
      return result
    end
  end

  def size
    @size
  end
end

class QueueItem
  attr_accessor :id, :prev_item

  def initialize(id)
    @id = id
    @prev_item = nil
  end
end
