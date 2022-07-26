require_relative './classes/storageIO/storage_manager'
require_relative './classes/execute'

class App
  attr_accessor :book_list, :people_list
  attr_reader :user_options

  def initialize
    @user_options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                     'List all rentals for a given person id', 'Exit']
    @storage_manager = StorageManager.new
    @state = @storage_manager.fetch_data
    @exec = Execute.new(@state)
  end

  def run
    while @state[:keep_going]
      p 'Please choose an option by entering a number:'
      @user_options.each_with_index do |option, index|
        p "#{index + 1} - #{option}"
      end
      user_choice = gets.chomp
      @exec.execute(user_choice)
    end
    @storage_manager.save_data(@state)
  end
end
