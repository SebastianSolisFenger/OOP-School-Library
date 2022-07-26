require 'fileutils'
require 'json'
require './student'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    FileUtils.mkdir_p(@path)
    FileUtils.touch("#{@path}/books.json") unless File.exist?("#{@path}/books.json")
    FileUtils.touch("#{@path}/people.json") unless File.exist?("#{@path}/people.json")
    FileUtils.touch("#{@path}/rentals.json") unless File.exist?("#{@path}/rentals.json")
  end

  def save_books(state)
    books_hash = state[:book_list].map { |book| { title: book.title, author: book.author } }
    books_json = JSON.generate(books_hash)
    File.write("#{@path}/books.json", books_json)
  end

  def save_people(state)
    students = state[:people_list].filter { |student| student.instance_of? Student }
    teachers = state[:people_list].filter { |teacher| teacher.instance_of? Teacher }
    students_hash = students.map do |student|
      { name: student.name, age: student.age, permission: student.parent_permission }
    end
    teacher_hash = teachers.map do |teacher|
      { name: teacher.name, age: teacher.age, specialization: teacher.specialization }
    end
    people_json = JSON.generate({ students: students_hash, teachers: teacher_hash })
    File.write("#{@path}/people.json", people_json)
  end

  def save_rentals(state)
    rentals_hash = state[:rental_list].map do |rental|
      { date: rental.date,
        book: rental.book.title,
        person_name: rental.person.name }
    end
    rentals_json = JSON.generate(rentals_hash)
    File.write("#{@path}/rentals.json", rentals_json)
  end
end
