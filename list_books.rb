class ListBooks
  def initialize(state)
    @state = state
    @book_list = state[:book_list]
  end

  def list_books
    if @book_list.empty?
      p 'There are no books in the list, please create a book choosing option 4'
    else
      @book_list.each { |book| p "Title: '#{book.title}', Author: #{book.author}" }
    end
    puts ''
  end
end
