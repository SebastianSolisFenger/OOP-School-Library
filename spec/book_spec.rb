require_relative '../classes/core/book'

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
end