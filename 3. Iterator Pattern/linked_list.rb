# A collection implemented as a circular doubly-linked
# list.
class LinkedList

  # Individual list nodes.
  class Node
    attr_accessor :prev, :next, :data
    def initialize(data=nil, prev=nil, next_=nil)
      @data = data
      @prev = prev
      @next = next_
    end
  end

  # Creates an empty list.
  def initialize
    @sentinel = Node.new
    @sentinel.prev = @sentinel
    @sentinel.next = @sentinel
  end

  # Returns true if this list is empty, otherwise
  # returns false.
  def empty?
    @sentinel.next == @sentinel
  end

  # Adds a new element to the start of this list.
  def add_first(e)
    node = Node.new(e, @sentinel, @sentinel.next)
    @sentinel.next.prev = node
    @sentinel.next = node
  end

  # Adds a new element to the end of this list.
  def add_last(e)
    node = Node.new(e, @sentinel.prev, @sentinel)
    @sentinel.prev.next = node
    @sentinel.prev = node
  end

  # Removes and returns the element at the start of this
  # list. Return nil if the list is empty.
  def remove_first
    return nil if empty?
    node = @sentinel.next
    e = node.data
    node.next.prev = @sentinel
    @sentinel.next = node.next
    e
  end

  # Removes and returns the element at the end of this
  # list. Return nil if the list is empty.
  def remove_last
    return nil if empty?
    node = @sentinel.prev
    e = node.data
    node.prev.next = @sentinel
    @sentinel.prev = node.prev
    e
  end
  
  # Yields to the given block for every element in 
  # this list.
  def each
    current = @sentinel.next
    while current != @sentinel
      yield current.data
      current = current.next
    end
  end

end