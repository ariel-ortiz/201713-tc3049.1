class MyClass
  def each
    yield 4
    yield 8
    yield 15
  end
end

# m = MyClass.new
# e = m.to_enum
# puts e.next
# puts e.next
# puts e.next
# puts e.next

class PowersOf10
  
  def initialize(max)
    @max = max
  end
  
  def each
    0.upto(@max) do |i|
      yield 10 ** i
    end
  end
  
end

pot = PowersOf10.new(10)
pot.each {|x| puts x}
e = pot.to_enum
begin
  loop do 
    puts e.next
  end
rescue StopIteration
  puts 'The End'
end

e.each {|x| puts x}