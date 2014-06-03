class Stack
  attr_accessor :top

  def initialize
    @top = nil
  end

  def push(data)
    data.next_data = @head
    @head = data
  end

  def pop
    if @head == nil
      raise 'Stack is empty'
    else
      return @head.id
      @head.next_data = @head
    end
  end
end

class StackData
  attr_accessor :id, :next_data

  def initialize(id)
    @id = id
    @next_data = nil
  end
end
