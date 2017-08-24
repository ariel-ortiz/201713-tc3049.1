require 'minitest/autorun'
require 'strategy'

class StrategyTest < Minitest::Test

  def setup
    @a = Course.new
    @b = Course.new
    STUDENT_LIST.each {|student| @b.add_student(student) }
  end

  def test_count_gender_strategy
    @a.strategy = CountGenderStrategy.new(:female)
    @b.strategy = CountGenderStrategy.new(:female)
    assert_equal(0, @a.execute)
    assert_equal(3, @b.execute)
    @a.strategy = CountGenderStrategy.new(:male)
    @b.strategy = CountGenderStrategy.new(:male)
    assert_equal(0, @a.execute)
    assert_equal(4, @b.execute)
  end

  def test_compute_average_gpa_strategy
    @a.strategy = ComputeAverageGPAStrategy.new
    @b.strategy = ComputeAverageGPAStrategy.new
    assert_nil(@a.execute)
    assert_equal(2.9, @b.execute)
  end

  def test_best_gpa_strategy
    @a.strategy = BestGPAStrategy.new
    @b.strategy = BestGPAStrategy.new
    assert_nil(@a.execute)
    assert_equal('Matthew', @b.execute)
  end

end
