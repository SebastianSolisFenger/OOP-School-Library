class CreateRental
  def initialize(state)
    @book_list = state[:book_list]
    @people_list = state[:people_list]
    @rental_list = state[:rental_list]
  end

  def ask_user_input
    p 'Select a book from the following list by number'
    @book_list.each_with_index do |book, index|
      p "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book = @book_list[gets.chomp.to_i]
    p 'Select a person from the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      p "#{index}) [#{person.class.name}] Name: '#{person.name}', ID: #{person.id}, Age: #{person.age}"
    end
    person = @people_list[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    [book, person, date]
  end

  def create_rental
    book, person, date = ask_user_input
    @rental_list << Rental.new(date, book, person)
    p 'Rental created successfully'
    puts ''
  end
end
