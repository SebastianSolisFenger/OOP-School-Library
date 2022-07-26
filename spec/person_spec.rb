require_relative '../classes/core/person'

describe Person do
  describe 'Constructor' do
    it 'Creates a new person with name "John" with age 20 and no parent_permission' do
      person = Person.new(20, 'John', parent_permission: false)
      
      person_name = person.name
      person_age = person.age
      can_use_setvices = person.can_use_services?

      expect(person_name).to eql('John')
      expect(person_age).to eql(20)
      expect(can_use_setvices).to eql(true)
    end
  end
end
