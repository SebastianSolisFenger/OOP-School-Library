require_relative '../classes/core/person'

describe Person do
  describe 'Constructor' do
    person = Person.new(20, 'John', parent_permission: false)
    
    person_name = person.name
    person_age = person.age
    can_use_setvices = person.can_use_services?
    
    it 'Creates a new person with name "John" with age 20 and no parent_permission' do
      expect(person_name).to eql('John')
      expect(person_age).to eql(20)
      expect(can_use_setvices).to eql(true)
    end
  end

  describe 'Getters and Setters' do
    person = Person.new(20, 'John', parent_permission: false)
    
    person_name = person.name
    person_age = person.age

    it 'returns name of "John"' do
      expect(person_name).to eql('John')
    end

    it 'returns age of 20' do
      expect(person_age).to eql(20)
    end

    person.name = 'Raul'
    person_name2 = person.name

    it "sets person's name to \"Raul\"" do
      expect(person_name2).to eql('Raul')
    end

    person.age = 16
    person_age2 = person.age

    it "sets person's age to 16" do
      expect(person_age2).to eql(16)
    end
  end

  describe 'Can Use Services' do
    person = Person.new(20, 'John', parent_permission: false)

    can_use_services = person.can_use_services?

    it 'returns true due to age 20 and parent_permission false' do
      expect(can_use_services).to eql(true)
    end

    person2 = Person.new(16, 'John', parent_permission: false)

    can_use_services2 = person2.can_use_services?

    it 'returns false due to age 16 and parent permission true' do
      expect(can_use_services2).to eql(false)
    end

    person3 = Person.new(16, 'John', parent_permission: true)

    can_use_services3 = person3.can_use_services?

    it 'returns true due to age 16 and parent_permission true' do
      expect(can_use_services3).to eql(true)
    end
  end
end
