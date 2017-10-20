class Pow2
  def each
    i = 1
    while i < 1_000
      yield i
      i *= 2
    end
  end
end

p = Pow2.new
e = p.to_enum
puts e.to_a
puts

gen = Enumerator.new do |y|
  i = 1
  while i < 1_000
    y << i
    i *= 2
  end
end

puts gen.to_a