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

  describe 'Getters and Setters' do
    person = Person.new(20, 'John', parent_permission: false)

    it 'returns name of "John"' do
      expect(person.name).to eql('John')
    end

    it 'returns age of 20' do
      expect(person.age).to eql(20)
    end

    it 'returns name "John"' do
      expect(person.name).to eql('John')
    end

    it "sets person's name to \"Raul\"" do
      person.name = 'Raul'
      expect(person.name).to eql('Raul')
    end

    it "sets person's age to 16" do
      person.age = 16
      expect(person.age).to eql(16)
    end
  end
end
