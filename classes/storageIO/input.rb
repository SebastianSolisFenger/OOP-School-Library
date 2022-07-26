require_relative '../core/book'
require_relative '../core/student'
require_relative '../core/teacher'
require 'json'

class Input
  def initialize(path)
    @path = path
  end

  def read_books()
    books_json = File.read("#{@path}/books.json")
    books_hash = JSON.parse(books_json)
    books_hash.map { |book| Book.new(book['title'], book['author']) }
  end

  def read_people()
    people_json = File.read("#{@path}/people.json")
    people_hash = JSON.parse(people_json)
    students = people_hash['students'].map do |student|
      Student.new(student['age'], student['name'], parent_permission: student['parent_permission'])
    end
    teachers = people_hash['teachers'].map do |teacher|
      Teacher.new(teacher['age'], teacher['name'], teacher['specialization'])
    end
    students.concat(teachers)
  end

  def read_rentals(people_list, books_list)
    rentals_json = File.read("#{@path}/rentals.json")
    rentals_hash = JSON.parse(rentals_json)
    rentals_hash.map do |rental|
      Rental.new(
        rental['date'],
        books_list.select { |book| book.title == rental['book'] } [0],
        people_list.select { |person| person.name == rental['person_name'] } [0]
      )
    end
  end
end
