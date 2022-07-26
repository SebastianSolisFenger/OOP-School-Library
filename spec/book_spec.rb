require_relative '../classes/core/book'

describe Book do
  describe 'Create a new book' do
    title = 'Clean Code'
    author = 'Robert C. Martin'
    newBook = Book.new(title, author)

    it 'is a book with title "Clean Code"' do
      expect(newBook.title).to eql('Clean Code')
    end

    it 'is a book with author "Robert C. Martin"' do
      expect(newBook.author).to eql('Robert C. Martin')
    end
  end
end