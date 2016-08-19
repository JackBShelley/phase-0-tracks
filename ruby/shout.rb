module Shout
  def yell_angrily(words)
    p words + "!!!" + " :("
  end
  def yelling_happily(words)
    p words + "!!!" + " :D"
  end
end

class Student
	include Shout
end

class Baby
	include Shout
end

baby = Baby.new
baby.yelling_happily("Yeah")

student = Student.new
student.yell_angrily("Yeah")

