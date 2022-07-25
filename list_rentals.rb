class ListRentals
  def initialize(state)
    @state = state
    @people_list = @state[:people_list]
  end

  def rentals_for_id
    if @people_list.empty?
      p 'There is no one to choose from'
    else
      print 'ID of person: '
      id = gets.chomp
      @people_list.each do |person|
        next unless person.id == id

        person.rentals.each do |rental|
          p "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
    puts ''
  end
end
