require 'json'

class Input
  def initialize(path)
    @path = path
  end

  def read_books(state)
    books_json = File.read("#{@path}/books.json")
    books_hash = JSON.parse(books_json)
    books = books_hash.map { |book| Book.new(book['title'], book['author']) }
    state[:book_list].concat(books)
  end

  def read_people(state)
    people_json = File.read("#{@path}/people.json")
    people_hash = JSON.parse(people_json)
    students = people_hash['students'].map do |student|
      Student.new(student['age'], student['name'], parent_permission: student['parent_permission'])
    end
    teachers = people_hash['teachers'].map do |teacher|
      Teacher.new(teacher['age'], teacher['name'], teacher['specialization'])
    end
    state[:people_list].concat(students).concat(teachers)
  end

  def read_rentals(state)
    rentals_json = File.read("#{@path}/rentals.json")
    rentals_hash = JSON.parse(rentals_json)
    rentals = rentals_hash.map do |rental|
      Rental.new(
        rental['date'],
        state[:book_list].select { |book| book.title == rental['book'] } [0],
        state[:people_list].select { |person| person.name == rental['person_name'] } [0]
      )
    end
    state[:rental_list].concat(rentals)
  end
end
