require 'minitest/autorun'
require 'problem1'

# Unit tests.
class StackTest < Minitest::Test

  # Assertions used for both classes.
  def common_tests(stack)
    assert_equal 0, stack.length
    assert stack.empty?
    refute stack.full?
    assert_equal 'top -> []', stack.to_s
    assert_same stack, stack.push(4)
    assert_equal 4, stack.peek
    assert_equal 1, stack.length
    assert_equal 'top -> [4]', stack.to_s
    refute stack.empty?
    refute stack.full?
    assert_same stack, stack.push(8)
    assert_equal 8, stack.peek
    assert_equal 2, stack.length
    refute stack.empty?
    refute stack.full?
    assert_equal 'top -> [8, 4]', stack.to_s
    assert_same stack, stack.push_all([15, 16, 23, 42])
    assert_equal 42, stack.peek
    assert_equal 6, stack.length
    refute stack.empty?
    refute stack.full?
    assert_equal 'top -> [42, 23, 16, 15, 8, 4]', stack.to_s
    assert stack.include?(42)
    assert stack.include?(16)
    assert stack.include?(4)
    refute stack.include?(0)
    refute stack.include?(5)
    assert_equal 42, stack.pop
    assert_equal 23, stack.pop
    assert_equal 'top -> [16, 15, 8, 4]', stack.to_s
    assert_equal 16, stack.peek
    assert_equal 4, stack.length
    refute stack.empty?
    refute stack.full?
    stack.clear
    assert_equal 0, stack.length
    assert stack.empty?
    refute stack.full?
    assert_equal 'top -> []', stack.to_s
    assert_raises(StackUnderflow) { stack.pop }
    assert_raises(StackUnderflow) { stack.peek }
    stack.clear
    assert_equal 0, stack.length
    assert stack.empty?
    refute stack.full?
    assert_equal 'top -> []', stack.to_s
  end

  # Test for the ArrayStack class.
  def test_ArrayStack
    stack = ArrayStack.new
    common_tests(stack)
    assert_raises(StackOverflow) do
      (1..100).each do |x|
        stack.push(x)
      end
    end
    assert_equal ArrayStack::STACK_SIZE, stack.length
    refute stack.empty?
    assert stack.full?
  end

  # Test for the LinkedListStack class.
  def test_LinkedListStack
    stack = LinkedListStack.new
    common_tests(stack)
    100.times do |x|
      stack.push(x)
    end
    assert_equal 100, stack.length
    refute stack.empty?
    refute stack.full?
  end

end
