require_relative './list_people'
require_relative './app'
require_relative './create_person'
require_relative './list_books'
require_relative './create_book'
require_relative './create_rental'
require_relative './list_rentals'
require_relative './exit'

class Execute
  def initialize(state)
    @people = ListPeople.new(state)
    @person = CreatePerson.new(state)
    @list_books = ListBooks.new(state)
    @create_book = CreateBook.new(state)
    @create_rental = CreateRental.new(state)
    @list_rentals = ListRentals.new(state)
    @exit = Exit.new(state)
  end

  def execute(user_choice) # rubocop:disable Metrics/CyclomaticComplexity
    case user_choice.to_i
    when 1 then @list_books.list_books
    when 2 then @people.list_people
    when 3 then @person.create_person
    when 4 then @create_book.create_book
    when 5 then @create_rental.create_rental
    when 6 then @list_rentals.rentals_for_id
    when 7 then @exit.exit_app
    else p 'Please enter a number between 1 and 7'
    end
  end
end
