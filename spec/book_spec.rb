require_relative '../classes/core/book'
require_relative '../classes/core/person'
require_relative '../classes/core/rental'

describe Book do
  describe 'Create a new book' do
    title = 'Clean Code'
    author = 'Robert C. Martin'
    book = Book.new(title, author)

    book_title = book.title
    book_author = book.author

    it 'is a book with title "Clean Code"' do
      expect(book_title).to eql('Clean Code')
    end

    it 'is a book with author "Robert C. Martin"' do
      expect(book_author).to eql('Robert C. Martin')
    end
  end

  describe Book do
    before :each do
      @book = Book.new('Siddharta', 'Hermann Hesse')
      @person = Person.new(25, 'Alexander')
    end

    it 'adds a rental to rentals array' do
      @book.add_rental('2022-03-09', @person)
      expect(@book.rentals.length).to eq 1
    end
  end
end
