#==========================================================
# Type your student ID and name here
#==========================================================

# Runtime exception class raised when a queue underflow
# occurs.
class QueueUnderflow < RuntimeError
end

# A queue (FIFO) data structure implemented
# using an array.
class Queue

  # The name for this queue.
  attr_reader :name

  # Initializes a queue with a name.
  def initialize(name)
    @name = name
    @info = []
  end

  # Inserts item at the back of this queue.
  # Returns the queue itself.
  def insert(item)
    @info << item
    self
  end

  # Removes and returns the item at the front of this
  # queue. Raises a QueueUnderflow exception if the queue
  # is empty.
  def remove
    raise QueueUnderflow if empty?
    @info.shift
  end

  # Returns the element at the front of this queue
  # without removing it. Raises a QueueUnderflow
  # exception if the queue is empty.
  def peek
    raise QueueUnderflow if empty?
    @info[0]
  end

  # Returns true if this queue is empty, otherwise
  # returns false.
  def empty?
    @info.empty?
  end

  # Adds the given block as an observer to this
  # queue.
  def add_observer(&block)
  end

end