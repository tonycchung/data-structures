class LinkedList
  attr_accessor :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def insert(node)
    @size += 1
    if @head == nil
      @head = node
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = node
    end
  end

  def size
    @size
  end

  def search(val)
    current = @head
    while current != nil
      if current.node_id == val
        return current
      else
        current = current.next_node
      end
    end
    return nil
  end

  def remove(node)
    current = @head
    if current == node
      @head = @head.next_node
      @size -= 1
    else
      while (current.next_node != nil) && (current.next_node != node)
        current = current.next_node
      end
      if current.next_node != nil
        current.next_node = (current.next_node).next_node
        @size -= 1
      else
        return nil
      end
    end
  end

  def to_s
    current = @head
    result = []
    while current != nil
      result << current.node_id
      current = current.next_node
    end
    puts result.map(&:inspect).join(', ')
  end
end

class Node
  attr_accessor :node_id, :next_node

  def initialize(node_id)
    @node_id = node_id
    @next_node = nil
  end
end
