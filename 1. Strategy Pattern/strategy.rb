class Student

  attr_reader :id, :name, :gender, :gpa

  def initialize(id, name, gender, gpa)
    @id = id
    @name = name
    @gender = gender
    @gpa = gpa
  end

end

class StudentStrategy

  def execute(array)
    raise 'Abstract method called!'
  end

end

class Course

  def strategy=(new_strategy)
    if !new_strategy.is_a? StudentStrategy
      raise 'Invalid argument. Was expecting a StudentStrategy.'
    end
    @strategy = new_strategy
  end

  def initialize
    @students = []
    @strategy = nil
  end

  def add_student(student)
    @students.push(student)
  end

  def execute
    @strategy.execute(@students)
  end

end

STUDENT_LIST = [Student.new(115, 'John', :male, 3.4),
                Student.new(841, 'Mary', :female, 2.6),
                Student.new(642, 'Matthew', :male, 4.0),
                Student.new(884, 'Mark', :male, 1.8),
                Student.new(536, 'Luke', :male, 2.6),
                Student.new(716, 'Magdalene', :female, 3.8),
                Student.new(780, 'Sapphira', :female, 2.1)]
