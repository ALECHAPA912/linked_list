require "./node.rb"

class LinkedList
  def initialize
    @first_node = nil
    @last_node = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @first_node == nil
      @first_node = new_node
    else
      @last_node.next_node = new_node
    end
    @last_node = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if @first_node == nil
      @first_node = new_node
      @last_node = new_node
    else
      @first_node = Node.new(value, @first_node)
    end
  end

  def size
    counter = 0
    current_node = @first_node
    while current_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def head
    @first_node.value
  end

  def tail
    @last_node.value
  end

  def at(index)
    counter = 0
    current_node = @first_node
    while index > counter
      current_node = current_node.next_node
      counter += 1
    end
    current_node.value
  end

  def pop # ARREGLAR PAPI
    current_node = @first_node
    while current_node.next_node != nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    @last_node = previous_node
  end

  def contains?(value)
    current_node = @first_node
    while current_node!= nil
      return true if value == current_node.value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @first_node
    counter = 0
    while current_node != nil
      return counter if value == current_node.value
      current_node = current_node.next_node
      counter += 1
    end
    nil
  end

  def to_s
    string = ""
    current_node = @first_node
    while current_node != nil
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "nil"
    string
  end

  def insert_at(value, index)
    current_node = @first_node
    previous_node = nil
    counter = 0
    while index > counter
      previous_node = current_node
      current_node = current_node.next_node
      counter += 1
    end
    new_node = Node.new(value, current_node)
    if previous_node == nil
      @first_node = new_node
    else
      previous_node.next_node = new_node
    end
  end

  def remove_at(index)
    current_node = @first_node
    previous_node = nil
    counter = 0
    while index > counter
      previous_node = current_node
      current_node = current_node.next_node
      counter += 1
    end
    if previous_node == nil
      @first_node = current_node.next_node
    else
      previous_node.next_node = current_node.next_node
    end
  end
end