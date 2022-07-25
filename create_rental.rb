require_relative 'list_books'
require_relative 'list_people'

class CreateRental
  def initialize(state)
    @book_list = state[:book_list]
    @people_list = state[:people_list]
    @rental_list = state[:rental_list]
    @list_books = ListBooks.new(state)
    @list_people = ListPeople.new(state)
  end

  def ask_user_input
    p 'Select a book from the following list by number'
    @list_books.list_books_with_index
    book = @book_list[gets.chomp.to_i]
    p 'Select a person from the following list by number (not id)'
    @list_people.list_people_with_index
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
