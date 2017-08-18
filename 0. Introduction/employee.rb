class Employee
  attr_reader :id
  def initialize(id)
    @id = id
  end
  def to_s
    "Employee[#{ @id }]"
  end
end

class Manager < Employee
  def initialize(id)
    super
    @managees = []
  end
  def add_managee(e)
    @managees << e
  end
  def to_s
    str_managees = ''
    @managees.each do |e|
      str_managees << (e.to_s + ' ')
    end
    super + ", my managees are: #{ str_managees }"
  end
end

e = Employee.new 123
puts e.id
puts e
m = Manager.new 99
puts m.id
m.add_managee(e)
puts m


