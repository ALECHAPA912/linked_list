require "./node.rb"

class LinkedList
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  def append(value)
    
    new_node = Node.new(value)

    if self.size == 0
      @head = new_node
      @tail = new_node
      return
    else
      @tail.next_node = new_node
      @tail = @tail.next_node
    end
    
  end

  def prepend(value)
    new_node = Node.new(value)
    if self.size == 0
      @tail = new_node
    else
      new_node = Node.new(value, @head)
    end
    @head = new_node
  end

  def size
    current_node = @head
    counter = 0
    while current_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    current_index = 0
    while current_node != nil && index != current_index
      idx += 1
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    current_node = @head
    (self.size - 1).times do
      current_node = current_node.next_node
    end
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    while current_node != nil && value != current_node.value
      current_node = current_node.next_node
    end
    return true if current_node.value == value
    false
  end

  def find(value)
    current_node = @head
    current_index = 0
    while current_node != nil && value != current_node.value
      current_index += 1
      current_node = current_node.next_node
    end
    return current_index if current_node.value == value
    nil
  end

  def insert_at(value, index)
    current_node = @head
    last_node = @head
    current_index = 0

    if index == 0
      @head = Node.new(value, @head)
      return
    end
    
    while current_node != nil && current_index != index
      last_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end
    
    new_node = Node.new(value, current_node)
    last_node.next_node = new_node

    if index == self.size-1
      @tail = new_node
    end
  end

  def remove_at(index)
    current_node = @head
    last_node = @head
    current_index = 0

    if index == 0
      @head = @head.next_node
      return
    end

    while current_node != nil && current_index != index
      last_node = current_node
      current_node = current_node.next_node
      current_index += 1
    end

    last_node.next_node = current_node.next_node

    if index == self.size-1
      @tail == current_node
    end

  end

  def to_s
    string = ""
    current_node = @head
    while current_node != nil
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "nil"
  end
end

