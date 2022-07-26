class CreateBook
  def initialize(state)
    @state = state
    @book_list = @state[:book_list]
  end

  def book_details
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    title, author = book_details
    @book_list << Book.new(title, author)
    p 'Book created successfully'
    puts ''
  end
end
