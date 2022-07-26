require_relative './input'
require_relative './output'

class StorageManager
  def initialize
    @path = './data'
    @input = Input.new(@path)
    @output = Output.new(@path)
  end

  def do_fetch_work()
    new_state = { book_list: [], people_list: [], rental_list: [], keep_going: true }
    new_state[:book_list] = @input.read_books
    new_state[:people_list] = @input.read_people
    new_state[:rental_list] = @input.read_rentals(new_state[:people_list], new_state[:book_list])

    new_state
  end

  def fetch_data()
    return do_fetch_work if Dir.exist?(@path)
  end

  def save_data(state)
    @output.create_files
    @output.save_books(state)
    @output.save_people(state)
    @output.save_rentals(state)
  end
end
