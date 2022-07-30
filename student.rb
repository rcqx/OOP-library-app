require './person'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission: true)
    super(name, age, parent_permission: true)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
