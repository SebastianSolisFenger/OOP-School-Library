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

  def list_people
    @people.each_with_index do |x, index|
      puts "#{index}) [#{x.class.name}] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}"
    end
  end

  def action_list_books
    list_book
    p '\n\n Press enter to continue...'
    gets.chomp
    run
  end

  def action_list_people
    list_people
    p '\n\n Press enter to continue...'
    gets
    run
  end

  def my_permission(my_char)
    case my_char
    when 'n'
      false
    when 'y'
      true
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, nil, specialization)
    @people.push(teacher)
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, name, my_permission(permission), nil)
    @people.push(student)
  end
end
