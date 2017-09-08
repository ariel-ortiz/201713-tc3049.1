require 'minitest/autorun'
require 'problem2'

# Unit tests.
class QueueTest < Minitest::Test

  # Do before each test.
  def setup
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
  end

  # Do after each test.
  def teardown
    $stdout = @old_stdout
  end

  # Test the Queue class.
  def test_Queue
    queue_alpha = Queue.new('Alpha')
    queue_beta = Queue.new('Beta')
    proc_observer = Proc.new do |queue, operation, item|
      puts "Proc object observing operation '#{ operation }'" \
           " on queue '#{ queue.name }' with item #{ item }."
    end
    queue_alpha.add_observer do |queue, operation, item|
      puts "Block observing operation '#{ operation }'" \
           " on queue '#{ queue.name }' with item #{ item }."
    end
    queue_alpha.add_observer(&proc_observer)
    queue_alpha.add_observer { puts "Just a casual block observer." }
    queue_beta.add_observer(&proc_observer)
    assert_same queue_alpha, queue_alpha.insert(1).insert(2).insert(3)
    assert_same queue_beta, queue_beta.insert(3).insert(4)
    assert_equal 1, queue_alpha.remove
    assert_equal 2, queue_alpha.remove
    assert_equal 3, queue_beta.remove
    assert_equal 4, queue_beta.remove
    assert_equal \
      "Block observing operation 'insert' on queue 'Alpha' with item 1.\n"       \
      "Proc object observing operation 'insert' on queue 'Alpha' with item 1.\n" \
      "Just a casual block observer.\n"                                          \
      "Block observing operation 'insert' on queue 'Alpha' with item 2.\n"       \
      "Proc object observing operation 'insert' on queue 'Alpha' with item 2.\n" \
      "Just a casual block observer.\n"                                          \
      "Block observing operation 'insert' on queue 'Alpha' with item 3.\n"       \
      "Proc object observing operation 'insert' on queue 'Alpha' with item 3.\n" \
      "Just a casual block observer.\n"                                          \
      "Proc object observing operation 'insert' on queue 'Beta' with item 3.\n"  \
      "Proc object observing operation 'insert' on queue 'Beta' with item 4.\n"  \
      "Block observing operation 'remove' on queue 'Alpha' with item 1.\n"       \
      "Proc object observing operation 'remove' on queue 'Alpha' with item 1.\n" \
      "Just a casual block observer.\n"                                          \
      "Block observing operation 'remove' on queue 'Alpha' with item 2.\n"       \
      "Proc object observing operation 'remove' on queue 'Alpha' with item 2.\n" \
      "Just a casual block observer.\n"                                          \
      "Proc object observing operation 'remove' on queue 'Beta' with item 3.\n"  \
      "Proc object observing operation 'remove' on queue 'Beta' with item 4.\n", \
      @out.string
  end

end
