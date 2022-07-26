require_relative './person'
require_relative './classroom'

class Student < Person
  attr_accessor :classroom

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
