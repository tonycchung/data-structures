class Node
  attr_accessor :node_id, :next_node, :prev_node

  def initialize(node_id)
    @node_id = node_id
    @prev_node = nil
    @next_node = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :size

  def initialize
    @size = 0
    @head = nil
  end

  def size
    @size
  end

  def add(val)
    node = Node.new(val)
    if @head == nil
      @head = node
      @tail = node
    else
      node.prev_node = @tail
      @tail.next_node = node
      @tail = node
    end
    @size += 1
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
        current = current.prev_node
      end
        break
    end
  end

  def remove(node)
    # If removing node at tail
    if node.prev_node == nil
      node.next_node.prev_node = nil
    else
      node.prev_node.next_node = node.next_node
    end
    # If removing node at head
    if node.next_node == nil
      node.prev_node.next_node == nil
    else
      node.next_node.prev_node = node.prev_node
    end
    return nil
  end

  def to_s
    current = @head
    result = []
    while current != nil
      result << current.node_id
      current = current.next_node
    end
    result.join(", ")
  end

  def deduplicate_with_array
    list = DoublyLinkedList.new
    self.to_s.split(", ").map {|n| n.to_i}.uniq.each { |value| list.add(value) }
    list
  end

  def deduplicate_slow
    pointer1 = @head
    while pointer1 != nil
      pointer2 = pointer1.next_node
      while pointer2 != nil
        if pointer2.node_id == pointer1.node_id
          pointer2.prev_node.next_node = pointer2.next_node
          pointer2.next_node.prev_node = pointer2.prev_node if pointer2.next_node != nil
        end
        pointer2 = pointer2.next_node
      end
      pointer1 = pointer1.next_node
    end
    self
  end

end
