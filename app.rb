# require './capitalize_decorator'
# require './trimmer_decorator'
require './person'
require './book'
require './teacher'
require './student'

# $my_books = []

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

class App
  def initialize
    @my_books = []
    @my_rentals = []
    @people = []
  end

  def show_menu
    puts "Welcome to School Library App!\n\n"
    puts "Please choose an option by entering a number:\n"
    p '1 - List all books'
    p '2 - List all people'
    p '3 - Create a people'
    p '4 - Create a book'
    p '5 - Create a rental'
    p '6 - List all rentals for a given person id'
    p "7 - Exit\n\n"
    action(gets.chomp)
  end

  def run
    choice = show_menu
    case choice
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      p 'Thanks for using this App!'
      exit
    end
  end

  def list_book
    @my_books.each_with_index do |x, index|
      puts "#{index}) Title: \"#{x.title}\", Author: #{x.author}"
    end
  end
end
