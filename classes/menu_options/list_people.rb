class ListPeople
  def initialize(state)
    @people_list = state[:people_list]
  end

  def list_people
    if @people_list.empty?
      p 'There are no people in the list, please create a person7 choosing option 3'
    else
      @people_list.each do |person|
        p "[#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
    puts ''
  end

  def list_people_with_index
    @people_list.each_with_index do |person, index|
      p "#{index}) [#{person.class.name}] Name: '#{person.name}', ID: #{person.id}, Age: #{person.age}"
    end
  end
end
