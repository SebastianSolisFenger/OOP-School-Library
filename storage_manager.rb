require_relative './input'
require_relative './output'

class StorageManager
  def initialize
    @path = './data'
    @input = Input.new(@path)
    @output = Output.new(@path)
  end

  def fetch_data(state)
    @input.read_books(state)
  end

  def save_data(state)
    @output.create_files
    @output.save_books(state)
  end
end
