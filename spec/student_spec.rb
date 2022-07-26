require_relative '../classes/core/student'
require_relative '../classes/core/classroom'

describe Student do
  describe 'Constructor' do
    student = Student.new(16, 'Raul', parent_permission: false)
    
    student_name = student.name
    student_age = student.age
    can_use_services = student.can_use_services?

    it 'Creates a new student on classroom 4 with name "Raul" with age 16 and no parent_permission' do
      expect(student_name).to eql('Raul')
      expect(student_age).to eql(16)
      expect(can_use_services).to eql(false)
    end
  end

  describe 'Play Hockey method' do
    student = Student.new(16, 'Raul', parent_permission: false)

    playing_hooky = student.play_hooky

    it "returns ¯\(ツ)/¯" do
      expect(playing_hooky).to eql("¯\(ツ)/¯")
    end
  end

  describe 'Add classroom to student' do
    classroom = Classroom.new('Arts')
    student = Student.new(20, 'maximilianus', parent_permission: false)

    student.add_to_classroom=(classroom)
    classroom_includes_student = classroom.students.include?(student)
    student_classroom = student.classroom

    describe 'Check if classroom contains student "maximilianus" and student contains the classroom' do  
      it 'returns true if student is in the classroom' do
        expect(classroom_includes_student).to be(true)
      end

      it 'returns true if student\'s classroom is the classroom declared beofre' do
        expect(student_classroom).to eql(classroom)
      end
    end
  end
end
