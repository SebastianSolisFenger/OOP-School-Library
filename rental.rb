class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book)
    @date = date
    @book = book
  end
end
