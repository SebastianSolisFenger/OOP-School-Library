require_relative '../classes/core/teacher'

describe Teacher do
  describe 'Constructor' do
    teacher = Teacher.new('Chemistry', 47, 'Mario', parent_permission: false)

    teacher_name = teacher.name
    teacher_age = teacher.age
    can_use_services = teacher.can_use_services?

    it 'Creates a new teacher specialized on chemistry with name "Mario" with age 47 and no parent_permission' do
      expect(teacher_name).to eql('Mario')
      expect(teacher_age).to eql(47)
      expect(can_use_services).to eql(true)
    end
  end

  teacher2 = Teacher.new('Chemistry', 16, 'Mario', parent_permission: false)

  can_use_services2 = teacher2.can_use_services?

  describe 'Can use services to always be true' do
    it 'should return true although age is 16 and parent_permission is set to false' do
      expect(can_use_services2).to eql(true)
    end
  end
end
