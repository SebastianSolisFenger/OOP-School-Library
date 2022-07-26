require_relative '../classes/core/rental'
require_relative '../classes/core/person'
require_relative '../classes/core/book'

describe Rental do
  book_title = 'Clean Code'
  book_author = 'Robert C. Martin'
  book = Book.new(book_title, book_author)
  
  person_name = 'Mr. Mario'
  person_age = 45
  parent_permission = false
  person = Person.new(person_age, person_name, parent_permission:  parent_permission)
  
  rental_date = '26/07/2022'
  rental = Rental.new(rental_date, book, person)
  
  rental_book = rental.book
  rental_date_test = rental.date
  rental_person_name = rental.person.name
  rental_book_title = rental.book.title
  
  describe 'Create a new rental' do
    it  'is a rental with date "26/07/2022"' do
      expect(rental_date_test).to eql('26/07/2022')
    end

    it 'has a person with name "Mr. Mario"' do
      expect(rental_person_name).to eql('Mr. Mario')
    end

    it 'has a book with title "Clean Code"' do
      expect(rental_book_title).to eql('Clean Code')
    end
  end
end
