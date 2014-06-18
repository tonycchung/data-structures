class DoublyLinkedList
  attr_accessor :head, :size

  def initialize
    @size = 0
    @head = nil
  end

  def add(node)
    if @head == nil
      @head = node
    else
      node.prev_node = @head
      @head.next_node = node
      @head = node
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
            break
          else
            current = current.prev_node
          end
        end
        return nil
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
    @size -= 1
  end

  def to_s
    current = @head
    result = []
    while current != nil
      result << current.node_id
      current = current.prev_node
    end
    result.join(", ")
  end

  def deduplicate_with_hash
    hash = {}
    current = @head
    while current != nil
      # hash[current.node_id] ? remove(current) : hash[current.node_id] = true
      if hash[current.node_id] == true
        remove(current)
      else
        hash[current.node_id] = true
      end
      current = current.prev_node
    end
  end

  def deduplicate_slow
    pointer1 = @head
    while pointer1 != nil
      puts "pointer1" + pointer1.node_id
      pointer2 = pointer1.prev_node
      while pointer2 != nil
        puts "pointer2" + pointer2.node_id
        if pointer1 == pointer2
          remove(pointer2)
        end
        pointer2 = pointer2.prev_node
      end
      pointer1 = pointer1.prev_node
    end
    self
  end
end

class DNode
  attr_accessor :node_id, :next_node, :prev_node

  def initialize(node_id)
    @node_id = node_id
    @prev_node = nil
    @next_node = nil
  end
end

linked_list = DoublyLinkedList.new

node1 = DNode.new '1'
node2 = DNode.new '2'
node3 = DNode.new '3'

linked_list.add(node1)
linked_list.add(node2)
linked_list.add(node2)

puts linked_list.search(node1.node_id)
puts linked_list.inspect
# linked_list.deduplicate_slow
# linked_list.deduplicate_with_hash
# puts linked_list.inspect
# hash = {}
# hash["#{node1.node_id}"] = node1
# if hash["#{node1.node_id}"] == node1
# linked_list.remove(node1)
# end
# puts hash[node1]
# puts hash.inspect

# linked_list.deduplicate_with_hash
# puts linked_list.inspect

    linked_list = DoublyLinkedList.new
    node1 = Node.new '1'
    linked_list.add(node1)
    puts linked_list.search(node1.node_id)
