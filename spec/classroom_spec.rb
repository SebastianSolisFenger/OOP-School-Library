require_relative '../classes/core/classroom'
require_relative '../classes/core/student'

describe Classroom do
  describe 'Constructor' do
    classroom_label = 'Microverse'
    classroom = Classroom.new(classroom_label)

    clsroom_label = classroom.label
    student_list_length = classroom.students.length

    it 'has a label property set to: "Microverse"' do
      expect(clsroom_label).to eql('Microverse')
    end

    it 'has a empty student list' do
      expect(student_list_length).to eql(0)
    end
  end

  describe 'Adding students' do
    classroom_label = 'Microverse'
    classroom = Classroom.new(classroom_label)
    students = [
      Student.new(20, 'Seba', parent_permission: true),
      Student.new(16, 'Mario', parent_permission: false),
      Student.new(17, 'Estefany', parent_permission: true)
    ]

    classroom.add_students(students[0])
    student_name = classroom.students[0].name

    it 'has one student with name "Seba"' do
      expect(student_name).to eql('Seba')
    end

    student_classroom = students[0].classroom

    it 'expects the student to have the classroom set' do
      expect(student_classroom).to eql(classroom)
    end

    classroom.add_students(students[1])
    students_quantity = classroom.students.length

    it 'has 2 students' do
      expect(students_quantity).to eql(2)
    end
  end
end
