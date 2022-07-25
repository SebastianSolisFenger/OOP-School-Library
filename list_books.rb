class ListBooks
  def initialize(state)
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

  def list_books_with_index
    @book_list.each_with_index do |book, index|
      p "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
  end
end
