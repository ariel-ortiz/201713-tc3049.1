#==========================================================
# Solution to problem 1.
#==========================================================

# Runtime exception class raised when a stack overflow
# occurs.
class StackOverflow < RuntimeError
end

# Runtime exception class raised when a stack underflow
# occurs.
class StackUnderflow < RuntimeError
end

# Base class for all stacks.
class SuperDaddyOfAllStacks

  # Abstract method push.
  def push(item)
    raise 'Called abstract method: push'
  end

  # Abstract method pop.
  def pop
    raise 'Called abstract method: pop'
  end

  # Abstract method empty?
  def empty?
    raise 'Called abstract method: empty?'
  end

  # Abstract method full?
  def full?
    raise 'Called abstract method: full?'
  end

  # Returns the element at the top of this stack
  # without removing it. Raises a StackUnderflow
  # exception if the stack is empty.
  def peek
    item = pop
    push(item)
    item
  end

  # Calls the given block once for each element in
  # this stack, passing that element as a parameter.
  def each(&block)
    temp = []
    while not empty?
      temp << pop
    end
    temp.reverse.each {|item| push(item)}
    temp.each(&block)
  end

  # Returns the number of elements in this stack.
  def length
    count = 0
    each { count += 1 }
    count
  end

  # Returns a string representation of this stack.
  def to_s
    'top -> [' + each.to_a.join(', ') + ']'
  end

  # Pushes all the elements in enumerable into this stack.
  # Returns the stack itself.
  def push_all(enumerable)
    enumerable.each do |item|
      push(item)
    end
    self
  end

  # Removes all elements from this stack.
  def clear
    while not empty?
      pop
    end
  end

  # Returns true if the given object is present in this
  # stack, otherwise returns false.
  def include?(object)
    each {|item| return true if item == object }
    false
  end

end

# A stack (LIFO) data structure implemented
# using an array with a fixed size.
class ArrayStack < SuperDaddyOfAllStacks

  STACK_SIZE = 10

  # Initializes a new fixed size stack.
  def initialize
    @info = Array.new(STACK_SIZE)
    @index = 0
  end

  # Push item at the top of this stack.
  # Raises a StackOverflow exception if the stack
  # is full. Returns the stack itself.
  def push(item)
    raise StackOverflow if full?
    @info[@index] = item
    @index += 1
    self
  end

  # Pop and return an item from the top of this stack.
  # Raises a StackUnderflow exception if the stack
  # is empty.
  def pop
    raise StackUnderflow if empty?
    @index -= 1
    @info[@index]
  end

  # Returns true if this stack is empty, otherwise
  # returns false.
  def empty?
    @index == 0
  end

  # Returns true if this stack is full, otherwise
  # returns false.
  def full?
    @index == STACK_SIZE
  end

end

# A stack (LIFO) data structure implemented
# using a linked list of variable size.
class LinkedListStack < SuperDaddyOfAllStacks

  # Node class required for singly linked list.
  class Node
    attr_accessor :info, :nxt
    def initialize(info, nxt=nil)
      @info = info
      @nxt = nxt
    end
  end

  # Initializes a new variable size stack.
  def initialize
    @start = nil
  end

  # Push item at the top of this stack.
  # Returns the stack itself.
  def push(item)
    @start = Node.new(item, @start)
    self
  end

  # Pop and return an item from the top of this stack.
  # Raises a StackUnderflow exception if the stack
  # is empty.
  def pop
    raise StackUnderflow if empty?
    item = @start.info
    @start = @start.nxt
    item
  end

  # Returns true if this stack is empty, otherwise
  # returns false.
  def empty?
    @start == nil
  end

  # Returns false given that a variable size stack
  # is never full.
  def full?
    false
  end

end
